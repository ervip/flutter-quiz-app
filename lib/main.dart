import 'package:flutter/material.dart';

import 'package:quiz_app/screens/start_screen.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 4, 7, 58),
        ),
        child: const StartScreen(),
      ),
    ),
  ));
}
