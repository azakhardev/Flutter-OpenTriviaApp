import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  late int totalPoints;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    totalPoints = ModalRoute.of(context)?.settings.arguments as int;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Results",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
            icon: const Icon(Icons.home)),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Text.rich(
            TextSpan(
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              children: [
                const TextSpan(
                  text: 'Congratulations, your score is ',
                  style: TextStyle(color: Colors.black),
                ),
                TextSpan(
                  text: totalPoints.toString(),
                  style: const TextStyle(color: Colors.green),
                ),
                const TextSpan(
                  text: '! Try your best next time.',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
