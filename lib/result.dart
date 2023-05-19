import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback restartMethod;
  Result(this.resultScore, this.restartMethod);

  String get resultPhrase {
    var resultText = 'You Did it';
    if (resultScore >= 8) {
      resultText = 'You are awsome and innocient!';
    } else if (resultScore >= 12) {
      resultText = 'Pretty likeable';
    } else if (resultScore >= 16) {
      resultText = 'You are .... strange?!';
    } else {
      resultText = 'you are so bad';
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    print(resultScore);
    return Center(
        child: Column(
      children: <Widget>[
        Text(
          resultPhrase,
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        OutlinedButton(
          onPressed: restartMethod,
          child: const Text(
            "Restart",
            style: TextStyle(
                color: Colors.green, fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.grey),
              foregroundColor: MaterialStateProperty.all(Colors.black12)),
          onPressed: restartMethod,
          child: const Text(
            "Elevated Button",
          ),
        ),
        TextButton(
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.amber),
              backgroundColor: MaterialStateProperty.all(Colors.blueGrey)),
          onPressed: restartMethod,
          child: const Text(
            "Elevated Button",
          ),
        ),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            primary: Colors.grey,
            side: BorderSide(color: Colors.green),
          ),
          onPressed: restartMethod,
          child: const Text(
            "Elevated Button",
          ),
        ),
      ],
    ));
  }
}
