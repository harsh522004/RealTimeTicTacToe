import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socketex/comman/elevated_button.dart';
import 'package:socketex/resources/socket_methods.dart';
import 'package:socketex/responsive/responsive.dart';
import 'package:velocity_x/velocity_x.dart';

class CreateRoom extends ConsumerStatefulWidget {
  static String routeName = '/createRoom';
  const CreateRoom({super.key});

  @override
  _CreateRoomState createState() => _CreateRoomState();
}

class _CreateRoomState extends ConsumerState<CreateRoom> {
  final TextEditingController _nicknameController = TextEditingController();
  // here uer connect to socket
  final SocketMethods _socketMethods = SocketMethods();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _socketMethods.createRoomSuccessListener(context, ref);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nicknameController.dispose();
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
              "Create Your Arena",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
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
            (context.screenHeight * 0.06).heightBox,
            CustomButton(
              onTap: () => _socketMethods.createRoom(_nicknameController.text),
              child: const Text("Be the Host!"),
            ),
          ],
        ).p(40),
      ),
    );
  }
}
