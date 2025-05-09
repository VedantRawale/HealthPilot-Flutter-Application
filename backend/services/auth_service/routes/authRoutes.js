const express = require('express');
const router = express.Router();
const { register, login, logout} = require('../controllers/authController');
const { authenticate } = require('../middleware/auth');  // Import the authenticate middleware

// Register Route
router.post('/register', register);

// Login Route
router.post('/login', login);

// Logout Route
router.post('/logout', logout);

// Example of a protected route
router.get('/profile', authenticate, (req, res) => {
    // You can access req.user here (user info from the token)
    return res.status(200).json({
        message: "Welcome to your profile!",
        user: req.user,  // Decoded user data from JWT
    });
});

module.exports = router;
