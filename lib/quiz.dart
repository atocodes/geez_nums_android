import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int indexNumber;
  final Function answerQuesiton;

  Quiz({
    required this.questions,
    required this.indexNumber,
    required this.answerQuesiton,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[indexNumber]['questionText'] as String),
        ...(questions[indexNumber]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(
            ()=>answerQuesiton(answer['score']),
            answer['text'] as String,
          );
        }).toList()
      ],
    );
  }
}
