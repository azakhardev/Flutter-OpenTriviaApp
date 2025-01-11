import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class SetupScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SetupScreenState();
}

class _SetupScreenState extends State<SetupScreen> {
  String url = "https://opentdb.com/api.php?";
  String amount = 'amount=10&';
  String category = '';
  String difficulty = '';
  String type = '';

  String categoryValue = '';
  String difficultyValue = '';
  String typeValue = '';

  final List<Map<String, dynamic>> _categoryOptions = [
    {"display": "Any Category", "value": ""},
    {"display": "General Knowledge", "value": "9"},
    {"display": "Books", "value": "10"},
    {"display": "Film", "value": "11"},
    {"display": "Music", "value": "12"},
    {"display": "Musicals & Theatres", "value": "13"},
    {"display": "Television", "value": "14"},
    {"display": "Video Games", "value": "15"},
    {"display": "Board Games", "value": "16"},
    {"display": "Science & Nature", "value": "17"},
    {"display": "Computer Science", "value": "18"},
    {"display": "Mathematics", "value": "19"},
    {"display": "Mythology", "value": "20"},
    {"display": "Sports", "value": "21"},
    {"display": "Geography", "value": "22"},
    {"display": "History", "value": "23"},
    {"display": "Politics", "value": "24"},
    {"display": "Art", "value": "25"},
    {"display": "Celebrities", "value": "26"},
    {"display": "Animals", "value": "27"},
    {"display": "Vehicles", "value": "28"},
    {"display": "Comics", "value": "29"},
    {"display": "Gadgets", "value": "30"},
    {"display": "Anime & Manga", "value": "31"},
    {"display": "Cartoon & Animations", "value": "32"},
  ];

  final List<Map<String, dynamic>> _difficultyOptions = [
    {"display": "Any Difficulty", "value": ""},
    {"display": "Easy", "value": "easy"},
    {"display": "Medium", "value": "medium"},
    {"display": "Hard", "value": "hard"},
  ];

  final List<Map<String, dynamic>> _typeOptions = [
    {"display": "Any Type", "value": ""},
    {"display": "Multiple Choice", "value": "multiple"},
    {"display": "True/False", "value": "boolean"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Setup Game"),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'Number of questions:',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Container(
              padding: const EdgeInsets.only(
                  top: 20, bottom: 20, left: 60, right: 60),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  hintText: 'From 10 to 50 questions',
                ),
                onChanged: (value) {
                  try {
                    int a = int.parse(value);
                    a > 50 ? amount = 'amount=50&' : amount = 'amount=$a&';
                    a < 10 ? amount = 'amount=10&' : amount = 'amount=$a&';
                  } catch (e) {
                    amount = 'amount=10&';
                  }
                },
              ),
            ),
            Text(
              'Category:',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Container(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: DropdownButton<String?>(
                value: categoryValue,
                items: _categoryOptions.map((option) {
                  return DropdownMenuItem<String>(
                    value: option['value'],
                    child: Text(option['display']),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    value != null
                        ? category = 'category=$value&'
                        : category = '';
                    value != null ? categoryValue = value : categoryValue = '';
                  });
                },
              ),
            ),
            Text(
              'Difficulty:',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Container(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: DropdownButton<String?>(
                value: difficultyValue,
                items: _difficultyOptions.map((option) {
                  return DropdownMenuItem<String>(
                    value: option['value'],
                    child: Text(option['display']),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    value != null
                        ? difficulty = 'difficulty=$value&'
                        : difficulty = '';
                    value != null
                        ? difficultyValue = value
                        : difficultyValue = '';
                  });
                },
              ),
            ),
            Text(
              'Type:',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Container(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: DropdownButton<String?>(
                value: typeValue,
                items: _typeOptions.map((option) {
                  return DropdownMenuItem<String>(
                    value: option['value'],
                    child: Text(option['display']),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    value != null ? type = 'type=$value&' : type = '';
                    value != null ? typeValue = value : typeValue = '';
                  });
                },
              ),
            ),
            Container(
              height: 300,
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () {
                  String finalUrl = _buildUrl();
                  Navigator.pushNamed(context, '/Play', arguments: finalUrl);
                },
                child: const Icon(Icons.play_arrow),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _buildUrl() {
    return (url + amount + category + difficulty + type);
  }
}
