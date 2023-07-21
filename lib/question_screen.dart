import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/models/answer_button.dart';

class QuizScreen extends StatefulWidget{
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() {
    return _QuizScreenState();
  }
}

class _QuizScreenState extends State<QuizScreen>{

   @override
  Widget build(context) {
     
     final currentQuestions = questions[0];
     
   return SizedBox(
    width: double.infinity,
     child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
       Text(currentQuestions.text, style:  const TextStyle(color: Color.fromARGB(255, 23, 17, 17),fontSize: 17),),
      const SizedBox(height: 30,),
      ...currentQuestions.answers.map((answer){
        return AnswerButton(answertext: answer, onTap: (){});
      })
     
    //  AnswerButton(answertext: currentQuestions.answers[0], onTap: (){}),
    //  AnswerButton(answertext:  currentQuestions.answers[1], onTap: (){}),
    //  AnswerButton(answertext:  currentQuestions.answers[2], onTap: (){}),
    //  AnswerButton(answertext:  currentQuestions.answers[3], onTap: (){}),
   
     ],),
   );
  }

}