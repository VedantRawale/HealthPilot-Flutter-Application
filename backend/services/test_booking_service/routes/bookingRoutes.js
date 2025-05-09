const express = require('express');
const router = express.Router();
const { book } = require('../controllers/bookingController');
const { authenticate } = require('../../auth_service/middleware/auth');  // Import the authenticate middleware

router.post('/book',authenticate,book);

module.exports = router;