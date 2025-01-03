import 'package:flutter/material.dart';
import 'package:flutter_quiz/components/answered_questions.dart';
import 'package:flutter_quiz/data/question_list.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chosenAnswers, required this.onRestart});

  final void Function() onRestart;
  final List<String> chosenAnswers;

  List<Map<String, Object>> getAnswersSummary(){
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++){
      summary.add({
        'question_index' : i,
        'question' : questions[i].text,
        'correct_answer' : questions[i].answers[0],
        'user_answer' : chosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {

    final numTotalQuestions = questions.length;
    final numCorrectQuestions = getAnswersSummary().where((data){
      return data['user_answer'] == data['correct_answer'];
    }
    ).length;


    return Center(
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              textAlign: TextAlign.center,
              'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            AnsweredQuestions(getAnswersSummary()),
            SizedBox(
              height: 20,
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: BorderSide(
                  color: Colors.white,
                )
              ),
              onPressed: onRestart, 
              child: Text('Play again?'))
          ],
        ),
      ),
    );
  }
}