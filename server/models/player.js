const mongoose = require("mongoose");

const playerSchema = new mongoose.Schema({
    nickname: {
        type: String,
        trim: true,
    },
    socketId: {
        type: String,
    },
    points: {
        type: Number,
        default: 0,
    },
    playerType: {
        require: true,
        type: String,
    }
});

module.exports = playerSchema;