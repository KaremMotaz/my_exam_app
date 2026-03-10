import 'package:flutter/material.dart';
import 'package:my_exam_app/quiz/presentation/views/welcome_view.dart';

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeView(),
    );
  }
}
