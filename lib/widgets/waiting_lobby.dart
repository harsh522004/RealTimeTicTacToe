import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

class WaitingLobby extends ConsumerWidget {
  const WaitingLobby({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Ready to Play!",
          style: TextStyle(fontSize: 35),
        ),
        const Text(
          " Waiting for Challenger...",
          style: TextStyle(fontSize: 20),
        ),
        (context.screenHeight * 0.2).heightBox,
        const Text(
          "ROOM CODE",
          style: TextStyle(fontSize: 20),
        ).centered(),
        (context.screenHeight * 0.01).heightBox,
        Container(
          decoration: BoxDecoration(
            color: Vx.green200,
            border: Border.all(),
            borderRadius: BorderRadius.circular(10),
          ),
          child: SelectableText(
            id,
            style: const TextStyle(fontSize: 20),
          ).centered(),
        ),
      ],
    ).p(40);
  }
}
