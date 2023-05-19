import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO : implement createState
    return _MyAppState();
  }
}

// ? _ <- putting this before the class name can trun the public class to private.
// ? and the class will only be available in the same file, also works for methods and class variables.
class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;
  final _questions = const [
    {
      'questionText': 'What is Youre favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1}
      ],
    },
    {
      'questionText': 'What is your favorite animal',
      'answers': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Snake', 'score': 11},
        {'text': 'Elepahant', 'score': 5},
        {'text': 'Lion', 'score': 9}
      ],
    },
    {
      'questionText': 'What is your favorite instructor',
      'answers': [
        {'text': 'ato-codes', 'score': 5},
        {'text': 'Beamlak', 'score': 10},
        {'text': 'mhcda', 'score': 8},
        {'text': 'you', 'score': 9}
      ],
    },
  ];
  
  void _resetQuiz(){
    setState((){
      _questionIndex = 0;
      _totalScore = 0;
    });
  }
  
  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex += 1;
    });

    // ? set state is a function that foreces flutter to re-render the ui
    // ? how ever not the entire.

    /*
    ? setState() updated the widget by calling the build() method again
    it only changes the specific element changes not the entire ui auto
     */
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      // Scaffold Creates a basic window fit for device
      appBar: AppBar(
        title: const Text("My App Title"),
      ),
      body: _questionIndex < _questions.length
          ? Quiz(
              questions: _questions,
              indexNumber: _questionIndex,
              answerQuesiton: _answerQuestion,
            )
          : Result(_totalScore,_resetQuiz),
    ));
  }
}
