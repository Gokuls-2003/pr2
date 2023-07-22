import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.choosenAnswer});

   final List<String> choosenAnswer;
  
  List<Map<String, Object>>  getSummaryData(){
    final List<Map<String, Object>> summary = [];

    for(var i =0;i<choosenAnswer.length;i++){
     
     summary.add({
      'question_index' : i,
      'question' : questions[i].text,
      'correct_answer' :questions[i].answers,
      'user_answer' : choosenAnswer[i]

     },
     );


    }
      return summary;
   }


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
       
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column
              (
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('you answered X out of y questions correctly!'),
                const SizedBox(height: 30,),
                QuestionSummary(getSummaryData()),
                const SizedBox(height: 30,),
                TextButton(onPressed: (){}, child:const Text('Restart Quiz!'))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
