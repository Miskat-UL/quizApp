import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'questionBank.dart';

AnotherQuestion questionBank = AnotherQuestion();

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          backgroundColor: Colors.yellow.shade500,
          title: Text(
            'Quizzler',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              color: Colors.black,
            ),
          ),
        ),
        body: SafeArea(
          child: QuizApp(),
        ),
      ),
    ),
  );
}

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool ans) {
    bool correctAns = questionBank.getAnswer();

    setState(() {
      if (questionBank.isFinished() == true) {
        Alert(
          context: context,
          title: 'Finished',
          desc: 'you have reached end of the quiz',
        ).show();

        questionBank.reset();
        scoreKeeper = [];
      } else {
        if (correctAns == ans) {
          scoreKeeper.add(
            Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        } else {
          scoreKeeper.add(
            Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }
        questionBank.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questionBank.getQuestion(),
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
            padding: const EdgeInsets.all(25.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                checkAnswer(false);
              },
            ),
          ),
        ),
        //TODO:add another thing in the tab;

        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}

// List<String> question = [
//   'You can lead a cow to down stears not up stears',
//   'Appreantly one fourth of human bones are in feet',
//   'A slug\'s blood is green',
//   'she is a great mom',
//   'i think that will be better',
//   'she loves us so much',
// ];

// List<bool> answer = [
//   true,
//   false,
//   true,
//   true,
//   false,
//   true,
// ];
