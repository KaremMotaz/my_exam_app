import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  final VoidCallback onPressed;
  const NextButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(10),
          minimumSize: const Size(double.infinity, 50),
          shape: const StadiumBorder(),
        ),
        onPressed: onPressed,
        child: const Text("Next"),
      ),
    );
  }
}
