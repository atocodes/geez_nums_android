import 'package:flutter/material.dart';
import 'dart:math';
// Model
import '../models/geeznum.dart';

class Anim extends StatefulWidget {
  @override
  AnimState createState() => AnimState();
}

class AnimState extends State<Anim> {
  final Random random = Random();
  List<Widget> nums = [];

  List<double> genereateRandomPosition() {
    List<double> positions = [];
    int screenWidth = (MediaQuery.of(context).size.width * 1).round();
    for (int i = 0; i <= 3; i++) {
      Random rand = Random();
      positions.add(rand.nextInt(screenWidth).toDouble());
    }
    return positions;
  }

  Future randomNumbers() {
    return Future.delayed(
      const Duration(seconds: 15),
      () {
        List<Widget> numbers = [];
        for (int i = 0; i <= 10; i++) {
          List<double> positions = genereateRandomPosition();
          Map<String, dynamic> geezNum = GeezNum.toGeeze(random.nextInt(1000));
          String name = geezNum['name'];
          String number = geezNum['number'];
          Widget item = AnimatedPositioned(
            right: positions[2],
            bottom: positions[3],
            duration: const Duration(seconds: 5),
            child: Text(
              '$number: $name',
              style: TextStyle(
                color: Color.fromARGB(103, 255, 255, 255),
                fontSize: Theme.of(context).textTheme.bodySmall!.fontSize,
              ),
            ),
          );

          numbers.add(item);
        }

        return numbers;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    randomNumbers().then((timeUp) => setState(() => nums = timeUp));

    return Container(
      height: MediaQuery.of(context).size.height * .5,
      width: double.infinity,
      child: Stack(
        children: nums,
      ),
    );
  }
}
