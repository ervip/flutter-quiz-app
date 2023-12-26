import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  final void Function() startQuizFunction;
  const StartScreen(this.startQuizFunction, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset('assets/images/quiz-logo.png', width: 300, height: 300),
        const SizedBox(height: 50),
        const Text(
          'Learn flutter the fun way !!',
          style: TextStyle(
            color: Colors.white,
            fontStyle: FontStyle.italic,
          ),
        ),
        const SizedBox(height: 50),
        OutlinedButton.icon(
          onPressed: startQuizFunction,
          icon: const Icon(
            Icons.arrow_right_alt,
            color: Colors.white,
          ),
          label: const Text(
            'Begin',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
