import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/models/question.dart';

class _Summary extends StatelessWidget {
  final List<Question> questions;
  final List<String> userAnswers;

  const _Summary({required this.questions, required this.userAnswers});

  Map<String, Object> processResult() {
    Map<String, Object> summary = {};
    summary['totalQuestions'] = questions.length;
    summary['totalAnswered'] = userAnswers.length;
    summary['totalCorrect'] = 0;
    summary['totalWrong'] = 0;
    summary['explained'] = [];

    for (int i = 0; i < questions.length; i++) {
      bool isCorrect = questions[i].checkOption(userAnswers[i]);
      if (isCorrect) {
        summary['totalCorrect'] = (summary['totalCorrect'] as int) + 1;
      } else {
        summary['totalWrong'] = (summary['totalWrong'] as int) + 1;
      }
      (summary['explained'] as List<dynamic>).add({
        'index': i,
        'question': questions[i].question,
        'correct': questions[i].options[0],
        'selected': userAnswers[i],
        'true_or_false': isCorrect
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    Map<String, Object> summary = processResult();
    return SizedBox(
      height: 400,
      child: ListView(
        children: [
          ...(summary['explained'] as List<dynamic>).map(
            (e) => ListTile(
              leading: Icon(
                e['true_or_false'] as bool ? Icons.check : Icons.close,
                color: e['true_or_false'] as bool
                    ? Colors.greenAccent
                    : Colors.redAccent,
              ),
              title: Text(
                e['question'] as String,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                "*${e['correct']}* is the correct answer.",
                style: const TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ResultScreen extends StatelessWidget {
  final List<String> chosenAnswers;
  final void Function() restartHandler;

  const ResultScreen(
      {super.key, required this.chosenAnswers, required this.restartHandler});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'RESULT',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            _Summary(questions: questions, userAnswers: chosenAnswers),
            const SizedBox(height: 20),
            OutlinedButton.icon(
              onPressed: restartHandler,
              icon: const Icon(Icons.restart_alt, color: Colors.white),
              label: const Text(
                'Restart Quiz',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
