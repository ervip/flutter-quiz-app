import 'package:flutter/material.dart';

class ColoredText extends StatelessWidget {
  final String outputText;
  final Color textColor;

  const ColoredText(this.outputText, this.textColor, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      outputText,
      style: TextStyle(
        color: textColor,
      ),
    );
  }
}
