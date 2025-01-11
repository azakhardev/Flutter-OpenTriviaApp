import 'dart:math';

import 'package:flutter/material.dart';
import 'package:open_trivia_app/models/question.dart';

class ButtonsWidget extends StatefulWidget {
  ButtonsWidget({required this.q, required this.onAnswerSelected});
  Question q;
  final ValueChanged<int> onAnswerSelected;

  @override
  State<StatefulWidget> createState() => _ButtonsWidgetState(question: q);
}

class _ButtonsWidgetState extends State<ButtonsWidget> {
  _ButtonsWidgetState({required this.question});

  Question question;
  bool clicked = false;

  List<String> answers = List.empty(growable: true);
  List<Color> buttonCollors = [
    Colors.blue,
    Colors.blue,
    Colors.blue,
    Colors.blue,
  ];

  @override
  void initState() {
    super.initState();
    _initializeAnswers();
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  //Is Called when ButtonsWidget is rebuilt - contains info of old and new widget
  @override
  void didUpdateWidget(covariant ButtonsWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.q != widget.q) {
      question = widget.q;
      _initializeAnswers();
    }
  }

  void _initializeAnswers() {
    answers.clear();
    buttonCollors = [Colors.blue, Colors.blue, Colors.blue, Colors.blue];

    int incorrectAnswer = 0;
    int chance = 25;
    bool correctAdded = false;
    clicked = false;

    if (widget.q.incorrect_answers.length < 3) {
      answers.add("True");
      answers.add("False");
      return;
    }

    for (int a = 0; a < 4; a++) {
      int random = Random().nextInt(100);
      if (random < chance && !correctAdded) {
        answers.add(widget.q.correct_answer);
        correctAdded = true;
      } else {
        chance += 25;
        answers.add(widget.q.incorrect_answers[incorrectAnswer++]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
        runSpacing: 20,
        spacing: 10,
        children: question.type != 'multiple'
            ? <Widget>[
                _generateButton(0),
                _generateButton(1),
              ]
            : <Widget>[
                _generateButton(0),
                _generateButton(1),
                _generateButton(2),
                _generateButton(3),
              ]);
  }

  ElevatedButton _generateButton(int index) {
    var bStyle = ElevatedButton.styleFrom(
        backgroundColor: buttonCollors[index], fixedSize: Size(200, 50));
    var answerText = Text(answers[index], textAlign: TextAlign.center,);
    if (answers[index] == question.correct_answer) {
      return ElevatedButton(
          style: bStyle,
          onPressed: () {
            if (!clicked) {
              setState(() {
                buttonCollors[index] = Colors.green;
              });
              widget.onAnswerSelected(10);
              clicked = true;
            }
          },
          child: answerText);
    } else {
      return ElevatedButton(
          style: bStyle,
          onPressed: () {
            if (!clicked) {
              setState(() {
                buttonCollors[index] = Colors.red;
              });
              widget.onAnswerSelected(-5);
              clicked = true;
            }
          },
          child: answerText);
    }
  }
}
