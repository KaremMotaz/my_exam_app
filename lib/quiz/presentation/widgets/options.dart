import 'package:flutter/material.dart';
import 'package:my_exam_app/quiz/data/models/question_model.dart';

class Options extends StatefulWidget {
  const Options({
    super.key,
    required this.questionModel,
    required this.onOptionTap,
    this.selectedIndex,
  });

  final QuestionModel questionModel;
  final Function(int optionIndex) onOptionTap;
  final int? selectedIndex;

  @override
  State<Options> createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  int? selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.questionModel.options.length,
      itemBuilder: (context, index) {
        bool isSelected = selectedIndex == index;
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
            widget.onOptionTap(index);
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            decoration: BoxDecoration(
              color: isSelected ? Colors.green.shade300 : Colors.white,
              border: Border.all(
                color: isSelected ? Colors.green : Colors.black,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            child: Center(
              child: Text(
                widget.questionModel.options[index],
                style: const TextStyle(fontSize: 25),
              ),
            ),
          ),
        );
      },
    );
  }
}
