import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';
import 'package:quiz_app/restart_button.dart';

class ResultsScreen extends StatelessWidget{
  const ResultsScreen({
    super.key, 
    required this.chosenAnswers,
    required this.onRestart,
  });

  final List<String> chosenAnswers;
  final void Function() onRestart;
  

  List<Map<String, Object>> getSummaryData(){
    List<Map<String, Object>> summary = [];
    for(var i = 0; i < chosenAnswers.length; i++){
      final isCorrect = chosenAnswers[i] == questions[i].answers[0];
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
        'question_index_style': TextStyle(
          color: isCorrect ?  Color.fromARGB(255, 35, 145, 186): const Color.from(alpha: 1, red: 0.325, green: 0.365, blue: 0.91),
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        'user_answer_style': TextStyle(
          color: isCorrect ? Color.fromARGB(255, 35, 145, 186) : const Color.from(alpha: 1, red: 0.325, green: 0.365, blue: 0.91),
          fontWeight: FontWeight.bold,
        ),
        'correct_answer_style': const TextStyle(
          color: Color.fromARGB(255, 35, 145, 186),
          fontWeight: FontWeight.bold,
        ),
      });
    }
    return summary;
  }


  @override
  Widget build(context)
  {
    final summaryData = getSummaryData();
    final numTotalQuestions = getSummaryData().length;
    final numTotalCorrect = summaryData.where(
      (data){
      return data['correct_answer'] == data['user_answer'];
     }
    ).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Text('You answered $numTotalCorrect out of $numTotalQuestions questions Correctly', style: const TextStyle(fontSize: 20, color: Colors.white)),
            const SizedBox(height:30,),
            DefaultTextStyle(
              style: const TextStyle(color: Colors.white),
              child: QuestionsSummary(summaryData: summaryData),
            ),
            const SizedBox(height:30,) ,
            RestartButton(
              onTap: onRestart,
            ),
          ],
        ),
      ),
    );
  }
}

