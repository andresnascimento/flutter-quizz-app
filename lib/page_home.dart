import 'package:flutter/material.dart';

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
           Expanded(
             child: Container(
              margin: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: [//background color of box
                  BoxShadow(
                    color: Color.fromRGBO(19, 25, 159, .2),
                    blurRadius: 24.0, // soften the shadow
                    spreadRadius: 0.0, //extend the shadow
                    offset: Offset(
                      0.0, // Move to right 10  horizontally
                      6.0, // Move to bottom 10 Vertically
                    ),
                  )
                ],
               ),
               child: Row(
                 children: <Widget>[
                   Container(
                     width: 150.0,
                     height: 150.0,
                     alignment: Alignment.center,
                     decoration: BoxDecoration(
                       image: DecorationImage(
                         image: AssetImage('images/category.png'),
                         fit: BoxFit.contain
                       )
                     ),
                   ),
                   Text('Category')
                 ],
               ),
             ),
           )
         ],
       ),
    );
  }
}