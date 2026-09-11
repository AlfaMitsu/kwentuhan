import 'package:flutter/material.dart';

class QuizAnswerButton extends StatelessWidget {
  const QuizAnswerButton({
    required this.answer,
    required this.state,
    required this.onPressed,
    super.key,
  });

  final String answer;
  final QuizAnswerButtonState state;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final color = switch (state) {
      QuizAnswerButtonState.correct => const Color(0xFF00BD6C),
      QuizAnswerButtonState.wrong => const Color(0xFFE6464D),
      QuizAnswerButtonState.normal => const Color(0xFF48AEE3),
    };
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: state == QuizAnswerButtonState.correct ? null : onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: state == QuizAnswerButtonState.normal ? Colors.black : color,
          backgroundColor: const Color(0xFFF7FBFF),
          side: BorderSide(color: color, width: 3),
          shape: const RoundedRectangleBorder(),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
          textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900, height: 1.15),
        ),
      ),
    );
  }
}

enum QuizAnswerButtonState { normal, correct, wrong }
