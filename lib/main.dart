import 'package:flutter/material.dart';
import 'package:open_trivia_app/screens/game_screen.dart';
import 'package:open_trivia_app/screens/results_screen.dart';
import 'package:open_trivia_app/screens/setup_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.green[400],
            titleTextStyle: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 24, color: Colors.black),
            centerTitle: true,
          ),
          textTheme: const TextTheme(
            headlineMedium:
                TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            labelMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
        routes: {
          '/': (context) => SetupScreen(),
          '/Play': (context) => GameScreen(),
          '/Results': (context) => ResultScreen(),
        });
  }
}
