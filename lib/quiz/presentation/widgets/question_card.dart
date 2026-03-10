import 'package:flutter/material.dart';
import 'package:my_exam_app/quiz/data/models/question_model.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({super.key, required this.questionModel});

  final QuestionModel questionModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(50),
      child: Container(
        padding: const EdgeInsets.all(50),
        width: double.infinity,
        child: Center(
          child: Text(questionModel.question, style: TextStyle(fontSize: 25)),
        ),
      ),
    );
  }
}
