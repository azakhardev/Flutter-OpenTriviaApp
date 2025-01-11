import 'dart:async';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:open_trivia_app/models/question.dart';
import 'package:open_trivia_app/screens/ScreenWidgets/buttons_widget.dart';

class GameScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<Question> questions = List.empty(growable: true);
  int currentQuestionIndex = 0;
  String url = "";
  late Future<void> _quizFuture;
  int score = 0;
  double time = 1;
  Timer? timer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    url = ModalRoute.of(context)?.settings.arguments as String;
    _quizFuture = _loadQuiz();
  }

  @override
  void initState() {
    super.initState();
    time = 1;
    timer = Timer.periodic(
      Duration(seconds: 1),
      (Timer timer) {
        setState(
          () {
            if (time > 0) {
              setState(() {});
              time -= 0.05;
            } else {
              _nextQuestion(-5);
            }
          },
        );
      },
    );
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game'),
      ),
      body: FutureBuilder(
        future: _quizFuture,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? Center(
                  child: Column(
                    children: [                     
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1)),
                        child: LinearProgressIndicator(
                          value: time,
                          color: Colors.blue,
                          minHeight: 15,
                          backgroundColor: Colors.blue[800],
                        ),
                      ),
                       Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.only(right: 5),                        
                        child: Text(
                          score.toString(),
                          textAlign: TextAlign.end,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                          height: 200,
                          padding: const EdgeInsets.only(
                              top: 50, left: 20, right: 20, bottom: 50),
                          child: Text(
                            questions[currentQuestionIndex].question,
                            style: Theme.of(context).textTheme.labelMedium,
                            textAlign: TextAlign.justify,
                          )),
                      ButtonsWidget(
                        q: questions[currentQuestionIndex],
                        onAnswerSelected: (points) async {
                          time += 0.10;
                          await Future.delayed(const Duration(seconds: 2));
                          setState(() {
                            _nextQuestion(points);
                          });
                        },
                      )
                    ],
                  ),
                )
              : const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  void _nextQuestion(int points) {
    if (score >= 0) {
      points < 0 && score == 0 ? score = 0 : score += points;
    }
    if (currentQuestionIndex < questions.length - 1) {
      currentQuestionIndex++;
    } else {
      Navigator.pushNamed(context, '/Results', arguments: score);
      timer!.cancel();
    }
    time = 1;
  }

  Future<Response<dynamic>> _loadQuiz() async {
    var response = await Dio().get(url);
    final data = response.data as Map<String, dynamic>;
    for (Map<String, dynamic> question in data['results']) {
      questions.add(Question.fromJson(question));
    }
    return response;
  }
}
