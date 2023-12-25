import 'package:flutter/material.dart';

import 'package:quiz_app/colored_text.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 4, 7, 58),
        ),
        child: const LandingPage(),
      ),
    ),
  ));
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

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
