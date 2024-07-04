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
    return Responsive(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("create room"),
            TextFormField(
              controller: _nicknameController,
              decoration:
                  const InputDecoration(hintText: "Enter your nickname"),
            ).p(20),
            CustomButton(
              onTap: () => _socketMethods.createRoom(_nicknameController.text),
              child: const Text("create room"),
            ),
          ],
        ),
      ),
    );
  }
}
