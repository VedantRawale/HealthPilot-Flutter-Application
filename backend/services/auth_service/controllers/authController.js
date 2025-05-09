const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const getDBConnection = require('../../../models/db')
const {generateHash,validateHash} = require('../../../utils/hash');
require('dotenv').config();

const redisClient = require('../../../helper/init_redis'); 

let pool;

const initializePool = async () => {
    pool = await getDBConnection();
};


initializePool();

exports.register = async (req, res) => {
    const {name,email,password} = req.body;
    if(name==null || email==null || password==null){
        return res.status(400).json({message : "Please provide all the fields"});
    }

    try {
        const [existingUser] = await pool.query("SELECT * FROM users WHERE email = ?", [email]);
        if (existingUser.length > 0) {
            return res.status(400).json({message: "User already exists"});
        }

        const passwordHash = await generateHash(password);

        const [result] = await pool.query(
            'INSERT INTO users (name, email, password_hash) VALUES (?, ?, ?)',
            [name, email, passwordHash]
        );

        return res.status(201).json({message: "User registered successfully", userId: result.user_id});

    } catch (error) {
        console.error(error);
        return res.status(500).json({message : "Internal server error"});
    }
};

exports.login = async (req, res) => {
    const {email,password} = req.body;
    if(email==null || password==null){
        return res.status(400).json({message : "Please provide all the fields"});
    }

    try {
        const [user] = await pool.query("SELECT * FROM users WHERE email = ?", [email]);
        if (user.length === 0) {
            return res.status(400).json({message: "Invalid email or password"});
        }

        const isPasswordValid = await validateHash(password, user[0].password_hash);
        if (!isPasswordValid) {
            return res.status(400).json({message: "Invalid email or password"});
        }

        const accessToken = jwt.sign({ id: user[0].user_id }, process.env.ACCESS_JWT_SECRET, { expiresIn: process.env.ACCESS_JWT_EXPIRES_IN });
        const refreshToken = jwt.sign({ id: user[0].user_id }, process.env.REFRESH_JWT_SECRET, { expiresIn: process.env.REFRESH_JWT_EXPIRES_IN});
        
        // console.log(jwt.decode(accessToken)); 
        // console.log(jwt.decode(refreshToken));
       
        await redisClient.set(`refreshToken:${user[0].user_id}`, refreshToken, 'EX', 365 * 24 * 60 * 60); 
        return res.status(200).json({ message: "Login successful", accessToken, refreshToken, userId: user[0].user_id, name: user[0].name });

    } catch (error) {
        // console.error(error);
        return res.status(500).json({message : "Internal server error"});
    }
};


exports.refreshToken = async (req, res) => {
    const { refreshToken } = req.body;
    if (!refreshToken) {
        return res.status(401).json({ message: "Refresh token is required" });
    }

    try {
        // Verify the refresh token
        const decoded = jwt.verify(refreshToken, process.env.REFRESH_JWT_SECRET);
        const userId = decoded.id;

        // Check if the refresh token exists in Redis or database
        const storedRefreshToken = await redisClient.get(`refreshToken:${userId}`);
        if (storedRefreshToken !== refreshToken) {
            return res.status(403).json({ message: "Invalid refresh token" });
        }

        // Generate a new access token
        const newAccessToken = jwt.sign({ id: userId }, process.env.ACCESS_JWT_SECRET, { expiresIn: process.env.ACCESS_JWT_EXPIRES_IN });

        return res.status(200).json({ message: "New access token generated", accessToken: newAccessToken });

    } catch (error) {
        // console.error(error);
        return res.status(500).json({ message: "Internal server error" });
    }
};

exports.logout = async (req, res) => {
    const { refreshToken } = req.body;
    if (!refreshToken) {
        return res.status(401).json({ message: "Refresh token is required" });
    }

    try {
        // Verify the refresh token
        const decoded = jwt.verify(refreshToken, process.env.REFRESH_JWT_SECRET);
        const userId = decoded.id;

        // Delete the refresh token from Redis or database
        await redisClient.del(`refreshToken:${userId}`);

        return res.status(200).json({ message: "Logged out successfully" });

    } catch (error) {
        // console.error(error);
        return res.status(500).json({ message: "Internal server error" });
    }
};
