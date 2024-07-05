import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socketex/provider/room_provider.dart';
import 'package:velocity_x/velocity_x.dart';

class Scoreboard extends ConsumerWidget {
  const Scoreboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final roomNotifier = ref.watch(roomProvider.notifier);
    final player1 = roomNotifier.player1;
    final player2 = roomNotifier.player2;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              player1.nickname,
              style: const TextStyle(fontSize: 20),
            ),
            Text(player1.points.toInt().toString()),
          ],
        ).p(30),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              player2.nickname,
              style: const TextStyle(fontSize: 20),
            ),
            Text(player2.points.toInt().toString()),
          ],
        ).p(30),
      ],
    );
  }
}
