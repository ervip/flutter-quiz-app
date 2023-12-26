import 'package:flutter/material.dart';

import 'package:quiz_app/colored_text.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/quiz-logo.png', width: 150, height: 150),
          const SizedBox(height: 50),
          const ColoredText('Learn flutter the fun way!', Colors.white),
          const SizedBox(height: 50),
          TextButton(
            onPressed: () {},
            child: const ColoredText('Start', Colors.white),
          )
        ],
      ),
    );
  }
}
