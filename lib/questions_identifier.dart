import 'package:flutter/material.dart';

class QuestionIndetifer extends StatelessWidget {
  const QuestionIndetifer({super.key,
  required this.isCorrectAnswer,
  required this.questionIndex,
  
  });

  final int questionIndex;
  final bool isCorrectAnswer;

  @override
  Widget build(BuildContext context) {
    final questionNumber = questionIndex+1;
    return Container(
     width: 30,
     height: 30,
     alignment: Alignment.center,
     decoration: BoxDecoration(
      color: isCorrectAnswer 
      ? Color.fromARGB(255, 243, 243, 243) 
      : const Color.fromARGB(255, 212, 21, 85),
      borderRadius: BorderRadius.circular(100),  
     ),
     child: Text(
      questionNumber.toString(),
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 156, 149, 149)
      ),
     ),
    );
  }
}