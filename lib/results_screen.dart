import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_summary.dart';


class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.choosenAnswer, required this.onRestart});

  final void Function() onRestart;
  final List<String> choosenAnswer;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAnswer.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'user_answer': choosenAnswer[i],
          'correct_answer': questions[i].answers[0],
        },
      );
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  'you answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    color: const Color.fromARGB(255, 23, 3, 3),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                QuestionSummary(summaryData),
                const SizedBox(
                  height: 30,
                ),
                TextButton.icon(onPressed:  onRestart,
                style: TextButton.styleFrom(foregroundColor: const Color.fromARGB(255, 22, 6, 6),
                ),
                 icon : const Icon(Icons.refresh),
                 label:const  Text('Restart Quiz'),


                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
