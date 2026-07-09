import 'package:flutter/material.dart';

class GuessInput extends StatelessWidget {
  const GuessInput({super.key, required this.onSubmitGuess});

  final void Function(String) onSubmitGuess;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded( // ขยายให้เต็มหน้าจอ
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              maxLength: 5,
              onSubmitted: onSubmitGuess,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.red,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(35)),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
