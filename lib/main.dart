import 'package:flutter/material.dart';
import 'quiz.dart';
import 'result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var totalScore = 0;
  static const List<Map<String, dynamic>> _questions = [
    {
      "question":
          "Which was the first purely object oriented programming language developed?",
      "answers": ["Kotlin", "SmallTalk", "Java", "C++"],
      "correctAns": "SmallTalk",
    },
    {
      "question":
          "Which feature of OOPs indicates code reusability?",
      "answers": ["Abstarction", "Polymorphism", "Encapsulation", "Inheritance"],
      "correctAns": "Inheritance",
    },
    {
      "question": "The feature by which one object can interact with another object is _____________",
      "answers": ["Message Reading", "Message Passing", "Data Transfer", "Data Binding"],
      "correctAns": "Message Passing",
    },
    {
      "question":
          " How many types of access specifiers are provided in OOP (C++)?",
      "answers": ["4", "3", "2", "1"],
      "correctAns": "3",
    },
    {
      "question":
          "Which among the following can show polymorphism?",
      "answers": ["Overloading &&", "Overloading <<", "Overloading ||", "Overloading +="],
      "correctAns": "Overloading <<",
    },
  ];

  void _answerQuestion(int res) {
    setState(() {
      totalScore += res;
      _questionIndex = (_questionIndex + 1);
    });
  }

  void _resetQuiz() {
    setState(() {
      totalScore = 0;
      _questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "UEM214086",
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("UEM214086"),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Text(
            "Reset Quiz",
            textAlign: TextAlign.center,
          ),
          
          onPressed: () {
            _resetQuiz();
          },
        ),
        body: Container(
          margin: const EdgeInsets.all(10),
          child: _questionIndex >= _questions.length
              ? Result(totalScore)
              : Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
