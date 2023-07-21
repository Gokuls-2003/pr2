import 'package:flutter/material.dart';



class GradientContainer extends StatelessWidget {
  const GradientContainer(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.asset(
            'assets/images/quizlogo.png',
            width: 2000,
            color: const Color.fromARGB(255, 42, 22, 22),
          ),

          // Opacity(
          //   opacity: 1.0,
          //   child: Image.asset(
          //     'assets/images/quizlogo.png',
          //     width: 2000,
          //   ),
          // ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Learn flutter in fun way!',
            style:
                TextStyle(color: Color.fromARGB(255, 23, 15, 15), fontSize: 25),
          ),
          const SizedBox(
            height: 100,
          ),
          OutlinedButton.icon(
              onPressed: startQuiz,
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 46, 32, 32),
              ),
              icon: const Icon(Icons.arrow_right_alt),
              label: const Text('Start Quiz'))
        ],
      ),
    );
  }
}
