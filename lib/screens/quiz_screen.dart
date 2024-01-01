import 'package:flutter/material.dart';

import 'package:quiz_app/data/questions.dart';

class QuizScreen extends StatefulWidget {
  final void Function(String answer) onSelectAnswer;
  const QuizScreen({super.key, required this.onSelectAnswer});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentIndex = 0;

  void answerQuestion(String answer) {
    setState(() {
      widget.onSelectAnswer(answer);
      currentIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Q. ${questions[currentIndex].question}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            ...questions[currentIndex].getOptions().asMap().entries.map(
              (option) {
                return OptionButton(
                  optionNumber: String.fromCharCode(65 + option.key),
                  optionText: option.value,
                  onPressed: () => answerQuestion(option.value),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class OptionButton extends StatelessWidget {
  final String optionText;
  final String optionNumber;
  final void Function() onPressed;

  const OptionButton({
    super.key,
    required this.optionNumber,
    required this.optionText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: const ButtonStyle(
        alignment: Alignment.centerLeft,
      ),
      child: Text(
        '$optionNumber. $optionText',
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
