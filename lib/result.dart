import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;

  const Result(this.score, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Your Score : $score / 10",
        
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
      ),
    );
  
  }
}
