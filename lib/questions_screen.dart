import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';


class QuestionsScreen extends StatefulWidget{
  const QuestionsScreen({super.key});

  State<QuestionsScreen> createState(){
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;
  void answerQuestion(){
    setState(() {
      currentQuestionIndex++;
    });
  }
  @override
  Widget build(BuildContext context){
    final currentQuestion = questions[0];

    return SizedBox(
        width: double.infinity,
        child: Container(
          margin:const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(currentQuestion.question,
            style:TextStyle(
              color:Colors.white,
              fontSize:20
            ),
              textAlign: TextAlign.center,
           ),
            const SizedBox(height:30),
            ...currentQuestion.getShuffledAnswers().map((item) {
              return AnswerButton(answerText: item,
                onTap: answerQuestion);
              })
          ],),
        ),
    );
  }
}