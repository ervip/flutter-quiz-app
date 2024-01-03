import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/screens/quiz_screen.dart';
import 'package:quiz_app/screens/result_screen.dart';

import 'package:quiz_app/screens/start_screen.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 4, 7, 58),
        ),
        child: const Quiz(),
      ),
    ),
  ));
}

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  late Widget screen;
  late Widget startScreen;
  late Widget quizScreen;
  late Widget resultScreen;
  late List<String> selectedAnswers;

  _QuizState() {
    selectedAnswers = [];
    startScreen = StartScreen(startQuiz);
    screen = startScreen;
  }

  void _setScreen(Widget screen) {
    setState(() {
      this.screen = screen;
    });
  }

  void startQuiz() {
    quizScreen = QuizScreen(onSelectAnswer: saveAnswer);
    _setScreen(quizScreen);
  }

  void saveAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      showResult();
    }
  }

  void showResult() {
    resultScreen = ResultScreen(
        chosenAnswers: selectedAnswers, restartHandler: restartQuiz);
    _setScreen(resultScreen);
  }

  void restartQuiz() {
    selectedAnswers.clear();
    setState(() {
      screen = startScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return screen;
  }
}
