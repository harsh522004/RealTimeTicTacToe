import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socketex/resources/game_methods.dart';

void mySnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
    ),
  );
}

void myAlertBox(BuildContext context, String content, WidgetRef ref) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(content),
        actions: [
          TextButton(
            onPressed: () {
              GameMethods().clearBoard(ref);
              Navigator.pop(context);
            },
            child: const Text("Play Again"),
          ),
        ],
      );
    },
  );
}
