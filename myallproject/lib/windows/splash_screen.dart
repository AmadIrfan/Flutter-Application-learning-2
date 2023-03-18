import 'dart:async';

import 'package:flutter/material.dart';
import '../windows/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        const Duration(
          seconds: 2,
        ), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: ((context) => const MyHomePage()),
        ),
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          gradient: LinearGradient(
            colors: [
              Colors.green.withOpacity(0.4),
              Colors.red.withOpacity(0.4),
              Colors.amber.withOpacity(0.4),
              Colors.greenAccent.withOpacity(0.4),
              Colors.grey.withOpacity(0.6),
            ],
            end: Alignment.bottomRight,
            begin: Alignment.topLeft,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Icon(
              Icons.person,
              color: Colors.black,
              size: 340,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Amad Irfan",
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 200,
              child: LinearProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}
