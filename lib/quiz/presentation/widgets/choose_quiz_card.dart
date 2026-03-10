import 'package:flutter/material.dart';
import 'package:my_exam_app/quiz/presentation/views/quiz_view.dart';

class ChooseQuizCard extends StatelessWidget {
  final String quizSubject;
  const ChooseQuizCard({super.key, required this.quizSubject});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return QuizView(quizSubject: quizSubject);
            },
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        child: Container(
          padding: const EdgeInsets.all(50),
          width: double.infinity,
          child: Center(
            child: Text(quizSubject, style: TextStyle(fontSize: 25)),
          ),
        ),
      ),
    );
  }
}
