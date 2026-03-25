import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary ({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context){
    return Column(
      children: summaryData.map(
        (data){
          return Row(
            children:[
              Text(
                ((data['question_index'] as int)+1).toString(),
                style: data['question_index_style'] as TextStyle,
              ),
              Expanded(
                child: Column(
                  children:[
                    Text(data['question'] as String),
                    const SizedBox(height:5,),
                    Text(
                      '${data['user_answer']}',
                      style: data['user_answer_style'] as TextStyle,
                    ),
                    Text(
                      '${data['correct_answer']}',
                      style: data['correct_answer_style'] as TextStyle,
                    ),
                  ],
                ),
              )
            ],
          );
        }
      ).toList(),
    );
  }
}