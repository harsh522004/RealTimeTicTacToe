const mongoose = require("mongoose");
const playerSchema = require("./player")

const roomSchema = new mongoose.Schema({
    occupancy: {
        type: Number,
        default: 2
    },
    maxRound: {
        type: Number,
        default: 6
    },
    currentRound: {
        type: Number,
        require: true,
        default: 1
    },
    players: [playerSchema],
    isJoin: {
        type: Boolean,
        default: true,
    },
    turn: playerSchema,
    turnIndex: {
        type: Number,
        default: 0
    }

});

const gameModel = mongoose.model("Room", roomSchema);
module.exports = gameModel;