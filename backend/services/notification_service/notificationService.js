require('dotenv').config();
const { Kafka } = require('kafkajs');
const nodemailer = require('nodemailer');

const {
  KAFKA_BROKER,
  KAFKA_CLIENT_ID,
  BOOKING_TOPIC,
  USE_TEST_EMAIL,
  SMTP_HOST,
  SMTP_PORT,
  SMTP_USER,
  SMTP_PASS,
  EMAIL_FROM
} = process.env;

// ——— 1. Configure Kafka consumer ———
const kafka = new Kafka({
  clientId: KAFKA_CLIENT_ID,
  brokers: [KAFKA_BROKER]
});
const consumer = kafka.consumer({ groupId: 'notification-group' });

// ——— 2. Configure Nodemailer transporter ———
let transporterPromise = (async () => {
  if (USE_TEST_EMAIL === 'true') {
    const testAccount = await nodemailer.createTestAccount();
    console.log('📧 Using Ethereal test SMTP account');
    return nodemailer.createTransport({
      host: testAccount.smtp.host,
      port: testAccount.smtp.port,
      secure: testAccount.smtp.secure,
      auth: {
        user: testAccount.user,
        pass: testAccount.pass,
      },
    });
  } else {
    // Use real SMTP credentials from .env
    console.log('📧 Using real SMTP account:', SMTP_HOST);
    return nodemailer.createTransport({
      host: SMTP_HOST,
      port: Number(SMTP_PORT),
      secure: Number(SMTP_PORT) === 465,
      auth: {
        user: SMTP_USER,
        pass: SMTP_PASS,
      },
    });
  }
})();

// ——— 3. Start consumer and process messages ———
async function start() {
  const transporter = await transporterPromise;

  await consumer.connect();
  await consumer.subscribe({ topic: BOOKING_TOPIC, fromBeginning: false });
  console.log(`🚀 Listening for booking events on "${BOOKING_TOPIC}"`);

  await consumer.run({
    eachMessage: async ({ message }) => {
      try {
        const event = JSON.parse(message.value.toString());
        const { userEmail, bookingId, date, time, testId } = event;

        const mailOptions = {
          from: EMAIL_FROM,
          to: userEmail,
          subject: 'Your Lab Test Booking is Confirmed!',
          text: `
Hello,

Your booking (ID: ${bookingId}) for test "${testId}" on ${date} at ${time} has been confirmed.

Thank you for choosing HealthPilot!

— The HealthPilot Team
          `.trim(),
        };

        const info = await transporter.sendMail(mailOptions);
        console.log(`✅ Sent booking email to ${userEmail}. Message ID: ${info.messageId}`);

        if (USE_TEST_EMAIL === 'true') {
          // Preview URL for Ethereal
          console.log('🔗 Preview URL:', nodemailer.getTestMessageUrl(info));
        }
      } catch (err) {
        console.error('Error processing booking notification:', err);
      }
    },
  });
}

start().catch(err => {
  console.error('Notification Service failed to start:', err);
  process.exit(1);
});
