import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WaitingLobby extends ConsumerWidget {
  const WaitingLobby({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("waiting lobby building");
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Waiting for the join another player ......"),
        SelectableText(id),
      ],
    );
  }
}
