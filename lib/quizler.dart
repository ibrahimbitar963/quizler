import 'package:flutter/material.dart';
import 'package:quizler/question.dart';
import 'package:quizler/question_bank.dart';
import 'question.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> TFList = [];
  QuestionBank qbank = QuestionBank();
  void CheckAnswer(bool userbicked) {
    setState(() {
          if(qbank.isFinished()==true){
            Alert(
              context: context,
              title: 'Finished!',
              desc: 'You\'ve reached the end of the quiz.',
            ).show();
            qbank.reset();
            TFList=[];
          }
          
          else{
      bool correctAnswer = qbank.GetCorrectAnswer();
    if (userbicked == correctAnswer) {
      TFList.add(Icon(Icons.check, color: Colors.green));
    } else {
      TFList.add(Icon(Icons.close, color: Colors.red));
    }

      qbank.NextQuestion();
    }});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black26,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  qbank.GetQuestionText(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: FlatButton(
                textColor: Colors.white,
                color: Colors.green,
                child: Text(
                  'True',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                onPressed: () {
                  CheckAnswer(true);

                  //The user picked true.
                },
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: FlatButton(
                color: Colors.red,
                child: Text(
                  'False',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  CheckAnswer(false);
                },
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: TFList,
            ),
          ),
        ],
      ),
    );
  }
}


