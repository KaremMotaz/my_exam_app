import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:my_exam_app/quiz/data/models/question_model.dart';

class QuizQuestionsLocalService {
  Future<List<QuestionModel>> getQuizQuestions({
    required String subject,
  }) async {
    final String jsonString = await rootBundle.loadString(
      'assets/json/${subject}_quiz.json',
    );

    final Map<String, dynamic> decoded = json.decode(jsonString);

    final List questions = decoded["questions"];

    return questions.map((q) => QuestionModel.fromJson(q)).toList();
  }
}
