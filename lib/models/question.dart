class Question {
  final String question;
  final List<String> options;
  final int answer;

  const Question({
    required this.question,
    required this.options,
    required this.answer,
  });

  List<String> getOptions() {
    final shuffledOptions = List.of(options);
    shuffledOptions.shuffle();
    return shuffledOptions;
  }

  bool checkOption(String option) {
    return option == options[answer];
  }
}
