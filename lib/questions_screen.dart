import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget{
  const QuestionsScreen({super.key, required this.onSelectAnswer});
  final void Function(String answer) onSelectAnswer;
  @override
  State<QuestionsScreen> createState(){
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;
  void answerQuestion(String selectedAnswer){
    widget.onSelectAnswer(selectedAnswer);
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
            style:GoogleFonts.lato(
              color:Colors.white,
              fontSize:20,
              fontWeight: FontWeight.bold
            ),
              textAlign: TextAlign.center,
           ),
            const SizedBox(height:30),
            ...currentQuestion.getShuffledAnswers().map((item) {
              return AnswerButton(answerText: item,
                onTap: answerQuestion(item););
              })
          ],),
        ),
    );
  }
}