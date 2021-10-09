import 'package:flutter/material.dart';
import 'package:quizler/quizler.dart';
import 'question.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black26,
          leading: Icon(
            Icons.menu_outlined,
          ),
        ),
        body: QuizPage(),
          ),
        );


  }
}

