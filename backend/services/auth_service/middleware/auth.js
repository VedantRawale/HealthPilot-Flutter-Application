const jwt = require('jsonwebtoken');
require('dotenv').config();



exports.authenticate = (req, res, next) => {
    const accessToken = req.header('Authorization')?.replace('Bearer ', ''); // Extract token from header

    if (!accessToken) {
        return res.status(401).json({ message: "Access Denied: No token provided" });
    }

    try {
        // Verify the token using the secret
        const decoded = jwt.verify(accessToken, process.env.ACCESS_JWT_SECRET);
        console.log("AccessToken : " + accessToken);
        console.log("DecodedToken : " + decoded);
        console.log("ACCESS_JWT_SECRET : " + process.env.ACCESS_JWT_SECRET);
        console.log("timeout" + process.env.ACCESS_JWT_EXPIRES_IN);

        console.log("Token issued at: " + new Date(decoded.iat * 1000));
        // Attach the decoded user data to the request object
        req.user = decoded;

        // Proceed to the next middleware or route handler
        next();
    } catch (err) {
        console.error("Token verification error:", err);
        return res.status(401).json({ message: "Invalid or expired token" });
    }
};
