const express = require('express');
const router = express.Router();

//--------------
const { Kafka } = require('kafkajs');
const kafka = new Kafka({ clientId: 'booking-service', brokers: [process.env.KAFKA_BROKER] });
const producer = kafka.producer();
(async () => {
    try {
      await producer.connect();
      console.log('✅ Kafka producer connected');
    } catch (err) {
      console.error('❌ Failed to connect Kafka producer:', err);
    }
  })();
//-------------------------------

const getDBConnection = require('../../../models/db');

let pool;

initiatePool = async () => {
    pool = await getDBConnection();
};

initiatePool();

exports.book = async (req, res) => {
    const { user_id, date, time, test_id } = req.body;
    console.log("Booking request received:", req.body);
    if (user_id == null || date == null || time == null || test_id == null) {
        return res.status(400).json({ message: "Please provide all the fields" });
    }
    
    let conn;
    try {
        conn = await pool.getConnection();
        await conn.beginTransaction();

        console.log("Transaction started");
        const [existingBooking] = await conn.query("SELECT * FROM bookings WHERE user_id = ? AND date = ? AND time = ? AND test_id = ?", [user_id, date, time, test_id]);
        if (existingBooking.length > 0) {
            return res.status(400).json({ message: "Booking already exists" });
        }

        const [rows] = await conn.query('SELECT * FROM slots WHERE date = ? AND time = ? FOR UPDATE', [date,time]);
        const slot = rows[0];


        if (!slot) {
            await conn.rollback();
            return res.status(404).json({ message: "Slot not found" });
        }

        if (slot.tot_booked >= slot.tot_capacity) {
            await conn.rollback();
            return res.status(400).json({ message: "Slot full" });
        }

        // Step 2: Insert booking
        const [bookingResult] = await conn.query(
            `INSERT INTO bookings (date, time, user_id, test_id, booked_at) VALUES (?, ?, ?, ?, ?)`,
            [date,time,user_id,test_id,new Date()]
        );

        if (bookingResult.affectedRows === 0) {
            await conn.rollback();
            return res.status(500).json({ message: "Failed to create booking" });
        }

        console.log("booking updated in db");

        // Step 3: Update slot capacity
        const [updateResult] = await conn.query(
            `UPDATE slots SET tot_booked = tot_booked + 1 WHERE date = ? AND time = ?`,
            [date, time]
        );
        if (updateResult.affectedRows === 0) {
            await conn.rollback();
            return res.status(500).json({ message: "Failed to update slot capacity" });
        }

        console.log("slot capacity updated");

        // Step 4: Commit transaction   
        await conn.commit();
        const [userEmailFromDB] = await conn.query("SELECT email FROM users WHERE user_id = ?", [user_id]);
        const event = {
            userEmail: userEmailFromDB[0].email, 
            bookingId: bookingResult.booking_id,
            date,
            time,
            test_id
          };
          
          await producer.send({
            topic: process.env.BOOKING_TOPIC || 'booking_confirmed',
            messages: [{ value: JSON.stringify(event) }],
          });
          
          await producer.disconnect();
          console.log("Producer disconnected");

        return res.status(200).json({ message: "Booking created successfully", bookingId: bookingResult.booking_id });

    } catch (error) {
        console.error(error);
        await conn.rollback();
        return res.status(500).json({ message: "Internal server error" });
    }
};