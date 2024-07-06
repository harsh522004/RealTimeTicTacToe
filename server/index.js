const express = require('express');
const socketIo = require('socket.io');
const http = require('http');
const mongoose = require('mongoose');
const app = express();
const server = http.createServer(app);
const io = socketIo(server);
const Room = require("./models/room");
const database = 'mongodb+srv://harshbutani125:LVieEHRKoS1P3j1F@cluster0.fktefhx.mongodb.net/game'



io.on('connection', (socket) => {
    console.log("A user connected");
    socket.on('createRoom', async ({ nickname }) => {

        try {

            // create room
            let room = new Room();

            // we define the player who crete this room
            let player = {
                socketId: socket.id,
                nickname,
                playerType: "X",
            };
            room.players.push(player);
            room.turn = player;

            // save current version of room in mongodb
            room = await room.save();

            // get roomId 
            const roomId = room._id.toString();
            console.log("Room created is : " + room);

            socket.join(roomId);

            // io : send data to everyone
            // socket : sending data to yourself or client

            io.to(roomId).emit("createRoomSuccess", room);

        } catch (error) {
            console.log("error during creating room" + error);
        }


    });

    socket.on('joinRoom', async (data) => {
        try {
            const nickname = data['nickname'];
            const roomId = data['roomId'];

            // print statement
            console.log(nickname);
            console.log(roomId);

            if (!roomId.match(/^[0-9a-fA-F]{24}$/)) {
                socket.emit("errorOccurred", "Please enter a valid room ID.");
                return;
            }


            // find the room
            let room = await Room.findById(roomId);

            // room validation
            if (!room) {
                console.log("room not find");
                socket.emit('errorOccurred', "room is not exist");
                return;
            }
            console.log("room is finded : ");
            console.log(room);

            // if room exist, then make sure that there is occupancy
            if (!room.isJoin) {

                socket.emit('errorOccurred', "room is fulled");
                return;
            }


            if (room.isJoin) {

                // create player 
                let player = {
                    socketId: socket.id,
                    nickname,
                    playerType: "O",
                };



                socket.join(roomId);


                // add player into room
                room.players.push(player);
                room.isJoin = false;
                console.log("added player and isJoin is false");
                // update the room
                room = await room.save();

                console.log("room is saved");


                // send response
                io.to(roomId).emit("joinRoomSuccess", room);
                io.to(roomId).emit('updateRoom', room);
                io.to(roomId).emit("updatePlayers", room.players);

            } else {
                socket.emit(
                    "errorOccurred",
                    "The game is in progress, try again later."
                );
            }
        } catch (error) {
            console.log("error during joining the room" + error);
        }


    });

    socket.on('tapGrid', async ({ index, roomId }) => {


        try {
            console.log("room id : ", roomId);
            console.log("index   : ", index);


            let room = await Room.findById(roomId);
            // saving current player choice X or O
            let choice = room.turn.playerType;

            // change the turn
            if (room.turnIndex == 0) {
                room.turn = room.players[1];
                room.turnIndex = 1;

            }
            else {
                room.turn = room.players[0];
                room.turnIndex = 0;
            }
            room = await room.save();
            console.log("saved the room");

            io.to(roomId).emit("tapped", { index, choice, room });

        } catch (error) {
            console.log(error);

        }


    });

    socket.on('winner', async ({ winnerSocketId, roomId }) => {


        console.log("event : winner");
        console.log("winner socketId : ", winnerSocketId.toString());
        console.log("room Id : ", roomId);

        try {
            let room = await Room.findById(roomId);
            let player = room.players.find(
                (playerr) => playerr.socketId == winnerSocketId
            );
            player.points += 1;
            room = await room.save();

            if (player.points >= room.maxRound) {
                io.to(roomId).emit("gameOver", player);
            } else {
                io.to(roomId).emit("pointUpdate", player);
            }

        } catch (error) {
            console.log(error);

        }
        // current room

    });
});

mongoose.connect(database).then(() => { console.log("connection succesfull") });
const PORT = 3000;
server.listen(PORT, "0.0.0.0", () => {
    console.log('...................................Server is running on port ' + PORT + '....................................');
});
