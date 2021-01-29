// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:random_quiz_app/page_home.dart';
// import 'quiz_brain.dart';

// QuizBrain quizBrain = QuizBrain();

// QuizList quizList =
//     QuizList(); // this creates a new object from the class QuizBrain

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromRGBO(0, 0, 241, 1),
        appBar: AppBar(
          title: Text('Cool Quiz'),
          backgroundColor: Color.fromRGBO(0, 0, 241, 1),
        ),
        body: QuizList(),
      ),
    );
  }
}
