import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:socketex/comman/snack_bar.dart';
import 'package:socketex/provider/board_elements.dart';
import 'package:socketex/provider/room_provider.dart';

class GameMethods {
  void winCheck(WidgetRef ref, BuildContext context, Socket client) {
    print("win check method called");
    final board = ref.read(boardProvider);
    final room = ref.read(roomProvider.notifier);
    final roomData = ref.read(roomProvider);
    String winner = "";

    // check rows
    if (board[0] == board[1] && board[0] == board[2] && board[0] != "") {
      winner = board[0];
    }
    if (board[3] == board[4] && board[3] == board[5] && board[3] != "") {
      winner = board[3];
    }
    if (board[6] == board[7] && board[6] == board[8] && board[6] != "") {
      winner = board[6];
    }

    // chekc columns
    if (board[0] == board[3] && board[0] == board[6] && board[0] != "") {
      winner = board[0];
    }
    if (board[1] == board[4] && board[1] == board[7] && board[1] != "") {
      winner = board[1];
    }
    if (board[2] == board[5] && board[2] == board[8] && board[2] != "") {
      winner = board[2];
    }

    // cross check
    if (board[0] == board[4] && board[0] == board[8] && board[0] != "") {
      winner = board[0];
    }
    if (board[2] == board[4] && board[2] == board[6] && board[2] != "") {
      winner = board[2];
    }

    // draw
    else if (!board.contains("")) {
      print("board filled");
      winner = "";
      myAlertBox(context, "Draw!", ref);
    }

    if (winner != "") {
      // check that is it player 1
      if (room.player1.playerType == winner) {
        print("player 1 winner");
        // show player 1 won
        myAlertBox(context, "${room.player1.nickname} won!!", ref);

        // emit winner socketid, roomid
        client.emit("winner", {
          "winnerSocketId": room.player1.socketId,
          "roomId": roomData['_id'],
        });
      } else {
        print("player 1 winner");
        // show player 2 won
        myAlertBox(context, "${room.player2.nickname} won!!", ref);

        // emit winner socketid, roomid
        client.emit("winner", {
          "winnerSocketId": room.player2.socketId,
          "roomId": roomData['_id'],
        });
      }
    }
  }

  void clearBoard(WidgetRef ref) {
    final boardnotifer = ref.read(boardProvider.notifier);
    final board = ref.read(boardProvider);

    for (int i = 0; i < board.length; i++) {
      boardnotifer.updateBoardElement(i, "");
    }
  }
}
