import 'package:flutter/material.dart';
import 'package:flutter_quiz/components/answer_button.dart';
import 'package:flutter_quiz/data/question_list.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {

var currentQuestionIndex = 0;
void answerQuestion(String selectedAnswer){
  widget.onSelectAnswer(selectedAnswer);
  setState(() {
    currentQuestionIndex++;
  });
}

  @override
  Widget build(BuildContext context) {

    final currentQuestion = questions[currentQuestionIndex];

    return Center(
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              textAlign: TextAlign.center,
              currentQuestion.text,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              )
            ),
            SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map((answer){
              return AnswerButton(
                text: answer, 
                onTap: (){
                  answerQuestion(answer);
                },
              );
            })
          ],
        ),
      )
    );
  }
}