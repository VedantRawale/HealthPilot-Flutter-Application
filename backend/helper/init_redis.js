const redis = require('redis');
const createClient = redis.createClient();

createClient.on('connect', (err) => {
    if (err) {
        console.log("Error connecting to Redis", err);
    } else {
        console.log("Connected to Redis");
    }
});

createClient.on('error', (err) => {
    console.log(err);
});

createClient.on('connection',(err)=>{
    if(err) console.log(err);
    else console.log("Redis connection established");
});

createClient.connect();

createClient.on('ready', () => {
    console.log("Redis client is ready to use");
});

createClient.on('end', () => {
    console.log("Redis client has disconnected");
});

createClient.on('reconnecting', (delay) => {
    console.log(`Redis client is reconnecting in ${delay}ms`);
});

module.exports = createClient;