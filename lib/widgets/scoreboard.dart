import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socketex/models/player.dart';
import 'package:socketex/provider/player_provider.dart';
import 'package:velocity_x/velocity_x.dart';

class Scoreboard extends ConsumerWidget {
  const Scoreboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerState = ref.watch(playerProvider);
    final player1 = playerState['player1'];
    final player2 = playerState['player2'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              player1['nickname'],
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              player1['points'].toString(),
              style: const TextStyle(fontSize: 22),
            ),
          ],
        ).p(30),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              player2['nickname'],
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              player2['points'].toString(),
              style: const TextStyle(fontSize: 22),
            ),
          ],
        ).p(30),
      ],
    );
  }
}
