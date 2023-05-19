import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answer;
  const Answer(this.selectHandler, this.answer, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        color: Colors.blue,
        margin: const EdgeInsets.all(5),
        child: ElevatedButton(
          onPressed: selectHandler,
          child: Text(answer),
        ));
  }
}
