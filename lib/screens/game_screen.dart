import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socketex/provider/room_provider.dart';
import 'package:socketex/resources/socket_methods.dart';
import 'package:socketex/widgets/waiting_lobby.dart';

class GameScreen extends ConsumerStatefulWidget {
  static String routeName = '/gameScreen';
  const GameScreen({super.key});

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends ConsumerState<GameScreen> {
  final SocketMethods _socketMethods = SocketMethods();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _socketMethods.updateRoomListner(context, ref);
    _socketMethods.updatePlayersListener(context, ref);
  }

  @override
  Widget build(BuildContext context) {
    //final roomNotifier = ref.read(roomProvider.notifier);
    final roomData = ref.watch(roomProvider);

    // print(roomNotifier.player1.nickname);
    // print(roomNotifier.player2.nickname);

    // isJoin true = wait
    // false = no wait
    return Scaffold(
      body: roomData['isJoin']
          ? WaitingLobby(id: roomData['_id'])
          : Center(
              child: Text(
                roomData.toString(),
              ),
            ),
    );
  }
}
