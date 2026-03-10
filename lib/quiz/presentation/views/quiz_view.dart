import 'package:flutter/material.dart';
import 'package:my_exam_app/quiz/data/local_service/quiz_questions_local_service.dart';
import 'package:my_exam_app/quiz/data/models/answer_model.dart';
import 'package:my_exam_app/quiz/data/models/question_model.dart';
import 'package:my_exam_app/quiz/presentation/views/result_view.dart';
import 'package:my_exam_app/quiz/presentation/widgets/quiz_content.dart';

class QuizView extends StatefulWidget {
  final String quizSubject;
  const QuizView({super.key, required this.quizSubject});

  @override
  State<QuizView> createState() => _QuizViewState();
}

class _QuizViewState extends State<QuizView> {
  final PageController? controller = PageController();
  List<QuestionModel> questions = [];
  Map<int, AnswerModel> answers = {};
  @override
  void initState() {
    loadQuestions();
    super.initState();
  }

  void loadQuestions() async {
    QuizQuestionsLocalService quizQuestionsLocalService =
        QuizQuestionsLocalService();
    final loadedQuestions = await quizQuestionsLocalService.getQuizQuestions(
      subject: widget.quizSubject.toLowerCase(),
    );
    setState(() {
      questions = loadedQuestions;
    });
  }

  void selectAnswer(int questionIndex, int optionIndex) {
    bool correct =
        questions[questionIndex].options[optionIndex] ==
        questions[questionIndex].answer;

    setState(() {
      answers[questionIndex] = AnswerModel(
        selectedIndex: optionIndex,
        isCorrect: correct,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quiz'), centerTitle: true),
      body: PageView.builder(
        controller: controller,
        itemCount: questions.length,
        itemBuilder: (context, index) => QuizContent(
          questionModel: questions[index],
          onOptionSelected: (optionIndex) {
            selectAnswer(index, optionIndex);
          },
          onNextPressed: () {
            if (index < questions.length - 1) {
              controller!.nextPage(
                duration: const Duration(milliseconds: 200),
                curve: Curves.linear,
              );
            } else {
              int score = answers.values.where((a) => a.isCorrect).length;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultView(
                    score: score,
                    totalQuestions: questions.length,
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
