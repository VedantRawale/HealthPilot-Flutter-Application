const exp = require('express');
const redisClient = require('./helper/init_redis');

const app = exp();

const port = 5000;

app.use(exp.json());

app.use('/api/auth', require('./services/auth_service/routes/authRoutes'));
app.use('/api',require('./services/test_recommendation_service/routes/suggestTestRoutes'));
app.use('/api',require('./services/test_booking_service/routes/bookingRoutes'));

app.listen(port,()=>{
    console.log("server running on port %d", port);
});

app.get("/api/testpackages",(req,res)=>{
    res.status(200).json({message : "Hi vedant"});
});

