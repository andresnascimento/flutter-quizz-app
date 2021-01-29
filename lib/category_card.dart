import 'package:flutter/material.dart';
import 'page_question.dart';

const defaultBoxShadow = BoxShadow(
  color: Color.fromRGBO(19, 25, 159, .2),
  blurRadius: 24.0, // soften the shadow
  spreadRadius: 0.0, //extend the shadow
  offset: Offset(
    0.0, // Move to right 10  horizontally
    6.0, // Move to bottom 10 Vertically
  ),
);

const defaultBorderRadius = 16.0;

class CategoryCard extends StatelessWidget {
  CategoryCard({@required this.categoryImage, @required this.categoryText});

  final String categoryImage;
  final Text categoryText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            new MaterialPageRoute(builder: (context) => QuizPage()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(defaultBorderRadius),
          boxShadow: [defaultBoxShadow],
        ),
        child: Row(
          children: <Widget>[
            Image.asset(
              categoryImage,
              width: 150.0,
              height: 150.0,
              fit: BoxFit.contain,
            ),
            categoryText,
          ],
        ),
      ),
    );
  }
}
