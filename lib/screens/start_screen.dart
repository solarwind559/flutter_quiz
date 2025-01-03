import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;


  @override
  Widget build(BuildContext context){
    return Center( // center widget takes up all the space
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/quiz-logo.png',
          width: 300,
          ),
          SizedBox(
            height: 30,
          ),
          Text('Test your flutter knowledge!',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          )
          ),
          SizedBox(
            height: 30,
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              side: BorderSide(
                color: Colors.white,
              )
            ),
            onPressed: startQuiz, 
            child: Text('Start quiz'))
        ],
      )
    );
  }

}