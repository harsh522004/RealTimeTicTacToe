import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socketex/provider/room_provider.dart';
import 'package:socketex/resources/socket_methods.dart';

class TictactoeBoard extends ConsumerStatefulWidget {
  const TictactoeBoard({super.key});

  @override
  _TictactoeBoardState createState() => _TictactoeBoardState();
}

class _TictactoeBoardState extends ConsumerState<TictactoeBoard> {
  final SocketMethods _socketMethods = SocketMethods();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _socketMethods.tappedListener(ref);
  }

  void tapGrid(int index) {
    final roomData = ref.read(roomProvider.notifier);
    final roomId = ref.read(roomProvider)["_id"].toString();
    print("room id in tap grid (board screen) : $roomId");
    print(
        "elements list (in board screen): ${roomData.boardElements.toString()}");
    _socketMethods.tapGrid(
      index,
      roomId,
      roomData.boardElements,
    );
  }

  @override
  Widget build(BuildContext context) {
    final roomdataNotifer = ref.watch(roomProvider.notifier);
    final size = MediaQuery.of(context).size;
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: size.height * 0.8, maxWidth: 400),
      child: GridView.builder(
          itemCount: 9,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => tapGrid(index),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: Center(
                  child: Text(
                    roomdataNotifer.boardElements[index],
                    style: const TextStyle(fontSize: 70),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
