import 'package:html_unescape/html_unescape.dart';

class Question {
  Question(
      {required this.type,
      required this.difficulty,
      required this.category,
      required this.question,
      required this.correct_answer,
      required this.incorrect_answers});

  String type;
  String difficulty;
  String category;
  String question;
  String correct_answer;
  List<String> incorrect_answers;

  factory Question.fromJson(Map<String, dynamic> json) {
    List<String> incorrect = List.empty(growable: true);

    for (dynamic answer in json['incorrect_answers'] as List<dynamic>) {
      incorrect.add(HtmlUnescape().convert(answer.toString()));
    }

    return Question(
        type: json['type'] as String,
        difficulty: json['difficulty'] as String,
        category: json['category'] as String,
        question: HtmlUnescape().convert(json['question'] as String),
        correct_answer: HtmlUnescape().convert(json['correct_answer'] as String),
        incorrect_answers: incorrect);
  }
}
