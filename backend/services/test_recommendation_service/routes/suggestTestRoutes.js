const express = require('express');
const { suggestTest } = require('../controllers/suggestTestController');
const router = express.Router();

router.post('/suggestTest', suggestTest);

module.exports = router;
