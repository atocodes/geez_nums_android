import "package:flutter/material.dart";
import 'widgets/app.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final double BORDER_WIDTH = 1.5;
  final BorderStyle BORDER_STYLE = BorderStyle.solid;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.symmetric(vertical: 2),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
              width: BORDER_WIDTH,
              style: BORDER_STYLE,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(15.0)),
            gapPadding: 4.0,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
              width: BORDER_WIDTH,
              style: BORDER_STYLE,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.yellow,
              width: BORDER_WIDTH,
              style: BORDER_STYLE,
            ),
          ),
          hintStyle: const TextStyle(
            color: Color.fromARGB(172, 255, 255, 255),
          ),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white, fontSize: 70),
          bodyMedium: TextStyle(color: Colors.white, fontSize: 35),
          bodySmall: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: App(),
    );
  }
}
