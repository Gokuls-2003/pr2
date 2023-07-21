import 'package:flutter/material.dart';
import 'package:quiz_app/gradient_container.dart';
import 'package:quiz_app/question_screen.dart';

class Quiz extends StatefulWidget{
 const  Quiz({super.key});
  @override
 State<Quiz> createState(){
  return _QuizState();
 }
}

class _QuizState extends State<Quiz>{

 var activeScreen = 'start-screen';

//  Widget ? activeScreen;
 
//  @override
//   void initState(){
//   activeScreen =  GradientContainer(switchScreen);
//     super.initState();
//  }
//  void switchScreen(){
//   setState(() {
//     activeScreen =  const QuizScreen();
//   });
//  }
void switchScreen(){
  setState(() {
    activeScreen = 'question-screen';
  });
 }

  @override
  Widget build(context){
    Widget screenWidget = GradientContainer(switchScreen);
    
    if(activeScreen == 'question-screen'){
    screenWidget= const QuizScreen();
    }
    return MaterialApp(
          home : Scaffold(
            body:  Container(
          decoration: const  BoxDecoration(
            gradient: LinearGradient(colors : [Color.fromARGB(255, 196, 218, 0),
            Color.fromARGB(255, 230, 231, 173)],
            begin : Alignment.topLeft,
            end: Alignment.bottomRight,
           
            )
            
          ),
      
              child: screenWidget,
            ),
          ),
    );
  }
}