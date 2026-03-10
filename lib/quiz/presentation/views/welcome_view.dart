import 'package:flutter/material.dart';
import 'package:my_exam_app/quiz/presentation/widgets/choose_quiz_card.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to My Exam App'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ChooseQuizCard(quizSubject: "Math"),
          ChooseQuizCard(quizSubject: "Science"),
          ChooseQuizCard(quizSubject: "English"),
        ],
      ),
    );
  }
}
