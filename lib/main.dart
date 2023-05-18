import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  void answerQuestion(){
    print('answer chosen');
  }

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
        title: const Text("My App Title"),
      ),
      body: Column(
        children: [
          Text("The Question"),
          ElevatedButton(
            child: Text('Answer 1'), 
            onPressed: answerQuestion),
          ElevatedButton(
            child: Text('Answer 2'), 
            onPressed: ()=>print('answer 2 Chosen')),
          ElevatedButton(
            child: Text('Answer 3'), 
            onPressed: () => print('Answer 3 Chosen')),
        ],
      ),
    ));
  }
}
