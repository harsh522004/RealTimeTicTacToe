import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socketex/provider/board_elements.dart';
import 'package:socketex/provider/room_provider.dart';
import 'package:socketex/resources/socket_methods.dart';
import 'package:velocity_x/velocity_x.dart';

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
    _socketMethods.tappedListener(ref, context);
  }

  void tapGrid(int index) {
    final boardData = ref.read(boardProvider);
    final roomId = ref.read(roomProvider)["_id"].toString();
    print("room id in tap grid (board screen) : $roomId");
    print("elements list (in board screen): $boardData}");
    _socketMethods.tapGrid(
      index,
      roomId,
      boardData,
    );
  }

  @override
  Widget build(BuildContext context) {
    final boardData = ref.watch(boardProvider);
    final roomData = ref.read(roomProvider);

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: context.screenHeight * 0.7,
        maxWidth: 500,
      ),
      child: AbsorbPointer(
        absorbing:
            (roomData['turn']['socketId'] != _socketMethods.socketClient.id),
        child: GridView.builder(
          itemCount: 9,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => tapGrid(index),
              child: Container(
                decoration: BoxDecoration(
                  color: Vx.hexToColor("cfcfb9"),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black),
                ),
                child: Center(
                  child: AnimatedSize(
                    duration: const Duration(milliseconds: 500),
                    child: Text(
                      boardData[index],
                      style: const TextStyle(fontSize: 70, color: Colors.white),
                    ),
                  ),
                ),
              ).p(2),
            );
          },
        ).p(35),
      ),
    );
  }
}
