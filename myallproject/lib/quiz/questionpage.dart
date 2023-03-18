import 'package:flutter/material.dart';

class QuestionPage extends StatelessWidget {
  const QuestionPage({super.key, required this.qString});

  final String qString;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 10,
      ),
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.green.withOpacity(0.4),
          Colors.red.withOpacity(0.4),
          Colors.amber.withOpacity(0.5),
        ]),
        // border: Border.all(
        // width: 2,
        // ),
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: Text(
        qString,
        style: const TextStyle(
          fontSize: 25,
          color: Color.fromARGB(255, 46, 46, 46),
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}
