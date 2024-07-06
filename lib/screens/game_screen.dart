import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socketex/provider/room_provider.dart';
import 'package:socketex/resources/socket_methods.dart';
import 'package:socketex/widgets/scoreboard.dart';
import 'package:socketex/widgets/tictactoe_board.dart';
import 'package:socketex/widgets/waiting_lobby.dart';
import 'package:velocity_x/velocity_x.dart';

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
    _socketMethods.pointUpdateListener(ref);
    _socketMethods.gameOverListener(context, ref);
  }

  @override
  Widget build(BuildContext context) {
    //final roomNotifier = ref.read(roomProvider.notifier);
    final roomData = ref.watch(roomProvider);

    return Scaffold(
      body: roomData['isJoin']
          ? WaitingLobby(id: roomData['_id'])
          : SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Scoreboard(),
                  const Flexible(child: TictactoeBoard()),
                  Text(
                    "${roomData['turn']['nickname']}'s turn",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 22),
                  )
                ],
              ).pSymmetric(v: 40),
            ),
    );
  }
}
