import 'dart:js';
import 'package:flutter/material.dart';
import 'package:untitled/quiz_brain.dart';
import 'package:quickalert/quickalert.dart';
QuizBrain quizbrain = QuizBrain();

void main() {
  runApp(Quizzler());
}

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
         body: SafeArea(
           child:Padding(
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
  List <Icon> scorekeeper= [];

  void checkanswer(bool userpickedanswer)
  {bool? correct = quizbrain.getquestionanswer();
  setState(() {
  if(correct == userpickedanswer)
  {
   scorekeeper.add(Icon(Icons.check, color: Colors.green,));
  }
  else{
    scorekeeper.add(Icon(Icons.close, color: Colors.red,));
  }

    quizbrain.nextquestion();
  });

  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget> [
          Expanded(
            flex: 5,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                   child: Text(
                    quizbrain.getquestionText(),
                     textAlign: TextAlign.center,
                     style: TextStyle(
                      fontSize: 25.0,
                      color:  Colors.white,
                     ),
                   ),
                ),
              ),
          ),
          Expanded(
              child:Padding(
                padding: EdgeInsets.all(15.0),
                    child: ElevatedButton(
                      onPressed: () {
                        checkanswer(true);
                        },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
                       backgroundColor: Colors.green,
                      ),
                         child: Text(
                           'TRUE',
                           style: TextStyle(
                             fontSize: 20.0,
                             color:Colors.white,
                       ),
                     ),
                    ),
                  ),
              ),
          Expanded(
            child:Padding(
              padding: EdgeInsets.all(15.0),
              child: ElevatedButton(
                onPressed: () {
                 checkanswer(false);
                  },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
                  backgroundColor: Colors.red,
                ),
                child: Text(
                  'FALSE',
                  style: TextStyle(
                    fontSize: 20.0,
                    color:Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: scorekeeper,
          ),
         ],
    );
  }
}
