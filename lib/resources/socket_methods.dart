import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:socketex/comman/snack_bar.dart';
import 'package:socketex/models/player.dart';
import 'package:socketex/provider/board_elements.dart';
import 'package:socketex/provider/player_provider.dart';
import 'package:socketex/provider/room_provider.dart';
import 'package:socketex/resources/game_methods.dart';
import 'package:socketex/resources/socket_client.dart';
import 'package:socketex/screens/game_screen.dart';
import 'package:socketex/screens/main_screen.dart';

class SocketMethods {
  final _socketClient = SocketClient.instance.socket!;

  Socket get socketClient => _socketClient;

  // emits
  void createRoom(String nickname) {
    if (nickname.isNotEmpty) {
      _socketClient.emit(
        'createRoom',
        {'nickname': nickname},
      );
    }
  }

  void joinRoom(String nickname, String roomId) {
    if (nickname.isNotEmpty && roomId.isNotEmpty) {
      _socketClient.emit(
        'joinRoom',
        {'nickname': nickname, 'roomId': roomId},
      );
    }
  }

  void createRoomSuccessListener(BuildContext context, WidgetRef ref) {
    _socketClient.on('createRoomSuccess', (room) {
      ref.read(roomProvider.notifier).updateRoomData(room);
      Navigator.pushNamed(context, GameScreen.routeName);
    });
  }

  void joinRoomsuceessListener(BuildContext context, WidgetRef ref) {
    _socketClient.on('joinRoomSuccess', (room) {
      ref.read(roomProvider.notifier).updateRoomData(room);
      Navigator.pushNamed(context, GameScreen.routeName);
    });
  }

  void updateRoomListner(BuildContext context, WidgetRef ref) {
    // print("updateRoomListner method initilize");
    _socketClient.on('updateRoom', (room) {
      //print("event : updateRoom");
      ref.read(roomProvider.notifier).updateRoomData(room);
    });
  }

  void errorOccuredListener(BuildContext context) {
    _socketClient.on("errorOccurred", (message) {
      mySnackBar(context, message);
    });
  }

  void updatePlayersListener(BuildContext context, WidgetRef ref) {
    print("updatePlayersListener method initilize");
    _socketClient.on("updatePlayers", (players) {
      print("event : updatePlayers");
      ref.read(playerProvider.notifier).updatePlayer1(players[0]);
      ref.read(playerProvider.notifier).updatePlayer2(players[1]);
    });
  }

  void tapGrid(int index, String roomId, List<String> elementList) {
    // print("index is (tap grid method) : ${index.toString()}");
    // print("roomId is (tap grid method) : $roomId");
    // print("element list in tap grid method : $elementList");

    if (elementList[index] == "") {
      //print("element is empty so emit the tapgrid");
      _socketClient.emit("tapGrid", {
        'index': index,
        'roomId': roomId,
      });
    }
  }

  void tappedListener(WidgetRef ref, BuildContext context) {
    _socketClient.on("tapped", (data) {
      //print("event : tapped");
      ref
          .read(boardProvider.notifier)
          .updateBoardElement(data['index'], data['choice']);
      ref.read(roomProvider.notifier).updateRoomData(data['room']);
      GameMethods().winCheck(ref, context, _socketClient);
    });
  }

  void gameOverListener(BuildContext context, WidgetRef ref) {
    _socketClient.on("gameOver", (player) {
      //print("event : gameOver");
      myAlertBox(context, "${player['nickname']} won the game!", ref);
      Future.delayed(const Duration(seconds: 4), () {
        Navigator.pushNamed(context, MainScreen.routeName);
      });
    });
  }

  void pointUpdateListener(WidgetRef ref) {
    _socketClient.on("pointUpdate", (playerData) {
      // print("event :pointUpdate ");
      final player = ref.read(playerProvider);
      if (playerData['socketId'] == player['player1']['socketId']) {
        ref.read(playerProvider.notifier).updatePlayer1(playerData);
      } else {
        ref.read(playerProvider.notifier).updatePlayer2(playerData);
      }
    });
  }
}
