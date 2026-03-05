import 'package:flutter/material.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/questions_screen.dart';


class ResultsScreen extends StatelessWidget{
  const ResultsScreen({super.key});

  @override
  Widget build(context)
  {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            const Text('You answered X out of Y questions Correctly'),
            const SizedBox(height:30,),
            const Text('List of Answers and Questions'),
            const SizedBox(height:30,),
            TextButton(
              onPressed: (){},
              child: const Text('Restart Quiz'),
            )
          ],
        ),
      ),
    );
  }
}

void chooseAnswer(String answer)
  {
    selectedAnswers.add(answer);
    if(selectedAnswers.length == questions.length){
      //switch to the results screen
      //setting to start screen for now
      setState(() {
        selectedAnswers = [];
        activeScreen = const ResultsScreen();
      });
    }
  }
