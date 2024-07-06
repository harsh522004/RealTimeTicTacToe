import 'package:flutter_riverpod/flutter_riverpod.dart';

class BoardNotifier extends StateNotifier<List<String>> {
  BoardNotifier() : super(List.filled(9, ''));

  void updateBoardElement(int index, String choice) {
    if (index >= 0 && index < state.length) {
      final List<String> newList = List<String>.from(state);
      newList[index] = choice;
      state = newList;
    }
  }
}

final boardProvider = StateNotifierProvider<BoardNotifier, List<String>>((ref) {
  return BoardNotifier();
});
