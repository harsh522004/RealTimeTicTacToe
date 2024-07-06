import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socketex/models/player.dart';

class PlayerNotifier extends StateNotifier<Map<String, dynamic>> {
  PlayerNotifier()
      : super({
          'player1':
              Player(nickname: "", playerType: '', socketId: '', points: 0)
                  .toMap(),
          'player2':
              Player(nickname: "", playerType: '', socketId: '', points: 0)
                  .toMap(),
        });

  void updatePlayer1(Map<String, dynamic> playerData) {
    print("old state : ${state.toString()}");
    state = {
      ...state,
      "player1": playerData,
    };
    print("new state for player 1: ${state.toString()}");
  }

  void updatePlayer2(Map<String, dynamic> playerData) {
    print("old state : ${state.toString()}");
    state = {
      ...state,
      "player2": playerData,
    };
    print("new state for player 2: ${state.toString()}");
  }
}

final playerProvider =
    StateNotifierProvider<PlayerNotifier, Map<String, dynamic>>((ref) {
  return PlayerNotifier();
});
