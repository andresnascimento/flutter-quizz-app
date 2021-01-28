// import 'dart:html';

import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'page_question.dart';

QuizBrain quizBrain =
    QuizBrain(); // this creates a new object from the class QuizBrain

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cool Quiz'),
          backgroundColor: Color.fromRGBO(0, 0, 241, 1),
        ),
        body: QuizPage(),
      ),
    );
  }
}


