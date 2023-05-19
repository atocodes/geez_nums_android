import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  Answer(this.selectHandler);
  
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        color : Colors.blue,
        margin : EdgeInsets.all(5),
        child: ElevatedButton(
          child: Text('Answer1'),
          onPressed: selectHandler,
        ));
  }
}
