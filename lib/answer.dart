import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  Answer(this.selectHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        color: Colors.blue,
        margin: const EdgeInsets.all(5),
        child: ElevatedButton(
          onPressed: selectHandler,
          child: const Text('Answer1'),
        ));
  }
}
