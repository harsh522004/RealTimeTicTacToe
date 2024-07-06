import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:socketex/screens/create_room.dart';
import 'package:socketex/screens/game_screen.dart';
import 'package:socketex/screens/join_room.dart';
import 'package:socketex/screens/main_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellowAccent),
        useMaterial3: true,
      ),
      initialRoute: MainScreen.routeName,
      routes: {
        MainScreen.routeName: (context) => const MainScreen(),
        CreateRoom.routeName: (context) => const CreateRoom(),
        JoinRoom.routeName: (context) => const JoinRoom(),
        GameScreen.routeName: (context) => const GameScreen()
      },
    );
  }
}
