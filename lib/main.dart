import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

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
    final questions =  const [
      {
        'questionText': 'What is Youre favorite color?',
        'answers': ['Black', 'Red', 'Green', 'White'],
      },
      {
        'questionText': 'What is your favorite animal',
        'answers': ['Rabbit', 'Snake', 'Elepahant', 'Lion'],
      },
      {
        'questionText': 'What is your favorite instructor',
        'answers': ['ato-codes', 'Beamlak', 'mhcda', 'you'],
      },
    ];
  void _answerQuestion() {
    setState(() {
      _questionIndex += 1;
    });
    if (_questionIndex < questions.length) {
      print('We Have more questions');
    }
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
      body: _questionIndex < questions.length ? Column(
        children: [
          Question(questions[_questionIndex]['questionText'] as String),
          ...(questions[_questionIndex]['answers'] as List<String>)
              .map((answer) {
            return Answer(_answerQuestion, answer);
          }).toList()
        ],
      ) : Center(
        child : Text('You Did it')
      ),
    ));
  }
}
