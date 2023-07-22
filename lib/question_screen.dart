import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/models/answer_button.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key, required this.onSelectAnswer});
  final void Function(String answer) onSelectAnswer;

  @override
  State<QuizScreen> createState() {
    return _QuizScreenState();
  }
}

class _QuizScreenState extends State<QuizScreen> {

  var currentQuestionIndex = 0;

 

  void answerQuestion(String selectedAnswer) {
   widget.onSelectAnswer(selectedAnswer);

    setState(() {
      currentQuestionIndex += 1;
    });
  }

  @override
  Widget build(context) {
    final currentQuestions = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestions.text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 23, 3, 3),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(
              height: 30,
            ),
            ...currentQuestions.getShuffledAnswer().map((answer) {
              return AnswerButton(answertext: answer, onTap: (){
                answerQuestion(answer);
              });
            })

            //  AnswerButton(answertext: currentQuestions.answers[0], onTap: (){}),
            //  AnswerButton(answertext:  currentQuestions.answers[1], onTap: (){}),
            //  AnswerButton(answertext:  currentQuestions.answers[2], onTap: (){}),
            //  AnswerButton(answertext:  currentQuestions.answers[3], onTap: (){}),
          ],
        ),
      ),
    );
  }
}
