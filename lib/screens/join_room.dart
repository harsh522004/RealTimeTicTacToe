import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socketex/comman/elevated_button.dart';
import 'package:socketex/resources/socket_methods.dart';
import 'package:velocity_x/velocity_x.dart';

class JoinRoom extends ConsumerStatefulWidget {
  static String routeName = '/joinRoom';
  const JoinRoom({super.key});

  @override
  _JoinRoomState createState() => _JoinRoomState();
}

class _JoinRoomState extends ConsumerState<JoinRoom> {
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _rooidController = TextEditingController();
  final SocketMethods _socketMethods = SocketMethods();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _socketMethods.joinRoomsuceessListener(context, ref);
    _socketMethods.errorOccuredListener(context);
    _socketMethods.updatePlayersListener(context, ref);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nicknameController.dispose();
    _rooidController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("join room"),
          TextFormField(
            controller: _nicknameController,
            decoration: const InputDecoration(hintText: "Enter your nickname"),
          ).p(20),
          TextFormField(
            controller: _rooidController,
            decoration: const InputDecoration(hintText: "Enter the Room Id"),
          ).p(20),
          CustomButton(
            onTap: () => _socketMethods.joinRoom(
                _nicknameController.text, _rooidController.text),
            child: const Text("join room"),
          ),
        ],
      ),
    );
  }
}
