import 'package:flutter/material.dart';
import '../game.dart';
import '../widgets/tile.dart';
import '../widgets/guess_input.dart';

class GamePage extends StatelessWidget {
  GamePage({super.key});
  // This manages game logic, and is out of scope for this lesson.
  final Game _game = Game(); // แถวทั้งหมด ดึงจาก Game.dart ตั้งตัวแปรแบบ private

  @override
  Widget build(BuildContext context) {
    debugPrint('ข้อความที่อยากดู');
    debugPrint('GamePage build');
    debugPrint('จำนวนแถว guess: ${_game.guesses.length}');
    
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        spacing: 5.0,
        children: [
          for (final guess in _game.guesses)
            Row(
              spacing: 5.0,
              children: [
                for (final letter in guess) Tile(letter.char, letter.type),
              ],
            ), // เรียก input user  onSubmitGuess เมื่อuserป้อนจะเอาขคไปทำไรต่อ
          GuessInput(
            onSubmitGuess: (guess) {
              debugPrint('submit guess: $guess');
            },
          ),
        ],
      ),
    );
  }
}
