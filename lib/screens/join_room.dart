import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socketex/comman/elevated_button.dart';
import 'package:socketex/resources/socket_methods.dart';
import 'package:socketex/responsive/responsive.dart';
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
      body: Responsive(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Nobody Likes to Go Second...",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Join Now!",
              style: TextStyle(fontSize: 20),
            ),
            (context.screenHeight * 0.06).heightBox,
            TextFormField(
              controller: _nicknameController,
              decoration: InputDecoration(
                hintText: "Enter your nickname",
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Vx.hexToColor("686820")),
                  borderRadius: BorderRadius.circular(5.5),
                ),
                enabledBorder: const OutlineInputBorder(),
              ),
            ),
            (context.screenHeight * 0.01).heightBox,
            TextFormField(
              controller: _rooidController,
              decoration: InputDecoration(
                hintText: "Enter room Id",
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Vx.hexToColor("686820")),
                  borderRadius: BorderRadius.circular(5.5),
                ),
                enabledBorder: const OutlineInputBorder(),
              ),
            ),
            (context.screenHeight * 0.06).heightBox,
            CustomButton(
              onTap: () => _socketMethods.joinRoom(
                  _nicknameController.text, _rooidController.text),
              child: const Text("Let's Play!"),
            ),
          ],
        ).p(40),
      ),
    );
  }
}
