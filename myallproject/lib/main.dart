import 'package:flutter/material.dart';
import '../single_page_application/model/transection.dart';
import 'package:provider/provider.dart';

import '../quiz/quiz_main.dart';
import '../windows/splash_screen.dart';
// import './windows/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Trans(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'All Project',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
        routes: {
          QuizMain.routName: (context) => const QuizMain(),
        },
      ),
    );
  }
}
