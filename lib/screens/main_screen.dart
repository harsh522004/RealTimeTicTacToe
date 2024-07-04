import 'package:flutter/material.dart';
import 'package:socketex/comman/elevated_button.dart';
import 'package:socketex/responsive/responsive.dart';
import 'package:socketex/screens/create_room.dart';
import 'package:socketex/screens/join_room.dart';

class MainScreen extends StatelessWidget {
  static String routeName = '/mainScreen';
  const MainScreen({super.key});

  void createRoomNavigate(BuildContext context) {
    Navigator.pushNamed(context, CreateRoom.routeName);
  }

  void joinRoomNavigate(BuildContext context) {
    Navigator.pushNamed(context, JoinRoom.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Welcome to the Game\nTIC TAC TOE  "),
            CustomButton(
              onTap: () => createRoomNavigate(context),
              child: const Text("create room"),
            ),
            CustomButton(
              onTap: () => joinRoomNavigate(context),
              child: const Text("join room"),
            )
          ],
        ),
      ),
    );
  }
}
