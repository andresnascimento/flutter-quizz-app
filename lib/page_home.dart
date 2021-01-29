import 'package:flutter/material.dart';
import 'category_card.dart';

class QuizList extends StatefulWidget {

  @override
  _QuizListState createState() => _QuizListState();
}

class _QuizListState extends State<QuizList> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Column(
         children: <Widget>[
           CategoryCard(
             categoryImage: 'images/category.png',
             categoryText: Text('Category'),
           )
         ],
       ),
    );
  }
}
