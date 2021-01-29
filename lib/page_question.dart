import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'category_card.dart';

QuizBrain quizBrain =
    QuizBrain();

class QuizPage extends StatefulWidget {
  // QuizPage({Key key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scoreIcons = [];
  int quizScore = 0;
  // CHECKS THE ANSWER, ++ICONS && ++SCORE
  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getQuestionAnswer();
    setState(() {
      if (quizBrain.isFinished() == true) {
        showScore();
      } else {
        if (correctAnswer == userPickedAnswer) {
          quizScore++;

          scoreIcons.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          scoreIcons.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        quizBrain.nextQuestion();
      }
    });
  }
  // CALLS THE BOTTOM DRAWER
  void showScore() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            color: Color(0xFF737373),
            height: 350,
            child: Container(
              child: _drawerContent(),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(defaultBorderRadius),
                  topRight: const Radius.circular(defaultBorderRadius),
                )
              ),
            ),
          );
        });
  }
  // BOTTOM DRAWER CONTENT
  Column _drawerContent() {
    return Column(
      children: <Widget>[
        Container(
          child: Text('Your Score is:'),
        ),
        Container(
          child: Text('$quizScore'),
        ),
        Container(
          child: RaisedButton(
            child: Text('Redo the quiz'),
            onPressed: () {
              setState(() {
                quizBrain.resetQuestions();
                scoreIcons = [];
                quizScore = 0;
                Navigator.pop(context);
              });
            },
          ),
        ),
        Container(
          child: RaisedButton(
            child: Text('Close'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey[100],
      child: Stack(
        overflow: Overflow.visible,
        alignment: Alignment.topCenter,
        children: <Widget>[
          Container(
            height: 200,
            color: Color.fromRGBO(0, 0, 241, 1),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 64),
                    height: 400,
                    decoration: new BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(defaultBorderRadius),
                      boxShadow: [defaultBoxShadow],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            quizBrain.getQuestionText(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24,
                              height: 1.4,
                              color: Colors.black,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(16),
                        child: RaisedButton(
                          elevation: 0,
                          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                          color: Color.fromRGBO(249, 207, 48, 1),
                          // textColor: Colors.white,
                          child: Text('👍 True', style: TextStyle(fontSize: 20)),
                          onPressed: () {
                            bool userPickedAnswer = true;
                            checkAnswer(userPickedAnswer);
                            print(quizScore);
                          },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(16),
                        child: RaisedButton(
                          elevation: 0,
                          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                          color: Color.fromRGBO(3, 4, 19, 1),
                          textColor: Colors.white,
                          child: Text('👎 False',style: TextStyle(fontSize: 20)),
                          onPressed: () {
                            bool userPickedAnswer = false;
                            checkAnswer(userPickedAnswer);
                          },
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: scoreIcons,
                    ),
                  )
                ],
              ),
            ),
        ],
      ),
    );
  }
}