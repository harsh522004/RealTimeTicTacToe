import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socketex/models/player.dart';

class RoomNotifier extends StateNotifier<Map<String, dynamic>> {
  RoomNotifier() : super({});

  final List<String> _boardElements = List.filled(9, '');

  Player _player1 =
      Player(nickname: " ", playerType: '', socketId: '', points: 0);

  Player _player2 =
      Player(nickname: " ", playerType: '', socketId: '', points: 0);

  Player get player1 => _player1;
  Player get player2 => _player2;
  List<String> get boardElements => List.unmodifiable(_boardElements);

  void updateRoomData(Map<String, dynamic> data) {
    print("current state : ${state.toString()}");
    state = data;
    print("updated state : ${state.toString()}");
  }

  void updatePlayer1(Map<String, dynamic> playerData) {
    _player1 = Player.fromMap(playerData);
  }

  void updatePlayer2(Map<String, dynamic> playerData) {
    _player2 = Player.fromMap(playerData);
  }

  void updateElements(int index, String element) {
    _boardElements[index] = element;
  }
}

final roomProvider =
    StateNotifierProvider<RoomNotifier, Map<String, dynamic>>((ref) {
  return RoomNotifier();
});
