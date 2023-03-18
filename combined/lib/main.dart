import 'package:combined/screens/filters_screen.dart';
import 'package:combined/screens/meal_detail_screen.dart';
import 'package:combined/screens/page_detail.dart';
import 'package:flutter/material.dart';
//import './screens/bottom_app_bar_screen.dart';
import './screens/tab_bar_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const TabBarScreen(),
      routes: {
        // "/": (context) => const TabBarScreen(),
        NewPageDetail.routeName: (context) => const NewPageDetail(),
        MealDetailScreen.routeName: (context) => const MealDetailScreen(),
        FilterScreen.routName: (context) => const FilterScreen(),
      },
      // initialRoute: "/",
      onUnknownRoute: (_) {
        return MaterialPageRoute(
          builder: ((context) => const TabBarScreen()),
        );
      },
    );
  }
}
