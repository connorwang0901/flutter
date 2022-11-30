import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/material.dart';
import 'package:quizzler/questions.dart';

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
  List<Widget> scoreKeeper = [];
  List<Questions> qs = [
    Questions("A slug\'s blood is green.", true),
    Questions('You can lead a cow down stairs but not up stairs.', true),
    Questions('Approximately one quarter of human bones are in the feet.', false),
    Questions('is Connor good looking?.', true),
    Questions('is Connor smart.', true),
    Questions('this question is false.', false),
    Questions('I hope this is true.', false),
    Questions('Choose false.', false)
  ];

  int score = 0;
  int questionNumber = 0;
  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                qs.elementAt(questionNumber).question,
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
            padding: EdgeInsets.all(3.0),
            child: TextButton(
              child: Container(
                height: 150,
                width: 300,
                color: Colors.green,
                child: Center(
                  child: Text(
                        'True',
                        style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        ),
                        ),
                ),
                ),
              onPressed: () {
                makeChoice(true);
              },
            ),
          ),
        ),
        Expanded(
              child: Padding(
                padding: EdgeInsets.all(3.0),
                child: TextButton(
                  child: Container(
                    height: 150,
                    width: 300,
                    color: Colors.red,
                    child: Center(
                      child: Text(
                        'False',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),

                  ),
                  onPressed: () {
                    makeChoice(false);
    },
                ),
              ),
            ),
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: scoreKeeper,
              ),
        )
      ],
    );
  }

  void makeChoice(bool choice){
    if(questionNumber < qs.length) {
      setState(() {
        if(choice == qs.elementAt(questionNumber).answer) {
          scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
          score++;
        }else {
          scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        String res = '$score/$questionNumber';
        if(questionNumber + 1 < qs.length) questionNumber++;
        else { Alert(
          context: context,
          title: "You finished all!",
          desc: "Your final score is : $res.",
        ).show();
          questionNumber = 0;
          scoreKeeper.clear();
          score = 0;
        }
      });
    }
  }

}

