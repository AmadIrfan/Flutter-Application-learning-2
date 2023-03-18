// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:myallproject/windows/home_page.dart';

class RestartQuiz extends StatelessWidget {
  const RestartQuiz({super.key, required this.reQuiz});
  final Function reQuiz;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              reQuiz();
            },
            child: const Text('Restart Quiz'),
          ),
          const SizedBox(
            height: 20,
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyHomePage(),
                ),
              );
            },
            child: const Text('Go to Main Menu'),
          ),
        ],
      ),
    );
  }
}
