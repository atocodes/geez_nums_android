import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> questions = [
      'What is Youre favorite color?',
      'What is your favorite animal',
    ];
    return MaterialApp(
        home: Scaffold(
      // Scaffold Creates a basic window fit for device
      appBar: AppBar(
        title: Text("My App Title"),
      ),
      body: const Column(
        children: [
          Text("The Question"),
          ElevatedButton(child: Text('Answer 1'), onPressed: null),
          ElevatedButton(child: Text('Answer 2'), onPressed: null),
          ElevatedButton(child: Text('Answer 3'), onPressed: null),
        ],
      ),
    ));
  }
}
