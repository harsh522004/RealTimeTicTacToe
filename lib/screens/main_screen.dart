import 'package:flutter/material.dart';
import 'package:socketex/comman/elevated_button.dart';
import 'package:socketex/responsive/responsive.dart';
import 'package:socketex/screens/create_room.dart';
import 'package:socketex/screens/join_room.dart';
import 'package:velocity_x/velocity_x.dart';

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Tic Tac Toe: \nDon't Get Blocked!",
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
          20.heightBox,
          CustomButton(
            onTap: () => createRoomNavigate(context),
            child: const Text("create room"),
          ).p(20),
          CustomButton(
            onTap: () => joinRoomNavigate(context),
            child: const Text("join room"),
          )
        ],
      ),
    );
  }
}
