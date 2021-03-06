import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'questions.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}



class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  List<Icon> scoreKeeper = [
  ];


  List<Questions> questionBank = [
    Questions(
      'You can lead a cow down stairs but not up stairs.',
      false
  ),
   Questions (
      'Approximately one quarter of human bones are in the feet.',
      true
  ),
   Questions(
      'A slug\'s blood is green.',
      true
  )
  ];



  int questionNumber = 0;

  void nextQuestion() {
    setState(() {
      if (questionNumber == 2) {
        questionNumber = 0;
      }
      else {
        questionNumber++;
      }
    });
  }

  void checkTrue() {
    if(questionBank[questionNumber].answer == true) {
      scoreKeeper.add(Icon(Icons.check, color: Colors.green,));
    }
    else{
      scoreKeeper.add(Icon(Icons.close, color: Colors.red,));
    }
  }

  void checkFalse() {
    if(questionBank[questionNumber].answer == false) {
      scoreKeeper.add(Icon(Icons.check, color: Colors.green,));
    }
    else{
      scoreKeeper.add(Icon(Icons.close, color: Colors.red,));
    }
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questionBank[questionNumber].question,
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
                //The user picked true.
                checkTrue();
                nextQuestion();
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
                //The user picked false.
               checkFalse();
               nextQuestion();
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
        //TODO: Add a Row here as your score keeper
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
