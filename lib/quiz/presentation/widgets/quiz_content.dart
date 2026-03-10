import 'package:flutter/material.dart';
import 'package:my_exam_app/quiz/data/models/question_model.dart';
import 'package:my_exam_app/quiz/presentation/widgets/next_button.dart';
import 'package:my_exam_app/quiz/presentation/widgets/options.dart';
import 'package:my_exam_app/quiz/presentation/widgets/question_card.dart';

class QuizContent extends StatefulWidget {
  const QuizContent({
    super.key,
    required this.questionModel,
    required this.onNextPressed,
    required this.onOptionSelected,
  });

  final QuestionModel questionModel;
  final VoidCallback onNextPressed;
  final Function(int optionIndex) onOptionSelected;

  @override
  State<QuizContent> createState() => _QuizContentState();
}

class _QuizContentState extends State<QuizContent> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        QuestionCard(questionModel: widget.questionModel),
        Options(
          questionModel: widget.questionModel,
          onOptionTap: (index) {
            setState(() {
              selectedIndex = index;
            });
            widget.onOptionSelected(index);
          },
          selectedIndex: selectedIndex,
        ),
        NextButton(
          onPressed: () {
            if (selectedIndex != null) {
              widget.onNextPressed();
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Please select an option")),
              );
            }
          },
        ),
      ],
    );
  }
}