import 'package:flutter/material.dart';
import 'package:flutter_quiz/data/question_list.dart';
import 'package:flutter_quiz/screens/questions_screen.dart';
import 'package:flutter_quiz/screens/results_screen.dart';
import 'package:flutter_quiz/screens/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}


class _QuizState extends State<Quiz> {

List<String> selectedAnswers = [];

  // Widget? activeScreen; // the startscreen.dart widget

  // @override
  // void initState() {
  //   super.initState();
  //   // activeScreen = StartScreen(switchScreen);
  // }


  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      // activeScreen = const QuestionsScreen();
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length){
      setState(() {
        // selectedAnswers = [];
        activeScreen = 'results-screen';
      });
    }
  }

  void restartQuiz(){
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(BuildContext context) {


  // final screenWidget = activeScreen == 'start-screen' 
  //   ? StartScreen(switchScreen) 
  //   : const QuestionsScreen();

  Widget screenWidget = StartScreen(switchScreen);

  if (activeScreen == 'questions-screen') {
    screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
  }

  if (activeScreen == 'results-screen') {
    screenWidget = ResultsScreen(
      chosenAnswers: selectedAnswers,
      onRestart: restartQuiz,
    );
  }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              colors: [ 
                const Color.fromARGB(255, 35, 35, 158),
                const Color.fromARGB(255, 106, 153, 253),
                ],
          )
        ),
        // child: activeScreen,
        child: screenWidget,
      ),
      )
    );
  }
}