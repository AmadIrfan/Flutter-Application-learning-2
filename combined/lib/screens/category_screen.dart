import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';

import '../widgets/category_screen_item.dart';
import '../model/dummy_meal.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width < 500) {
      return GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          childAspectRatio: 3 / 2,
          maxCrossAxisExtent: (MediaQuery.of(context).size.width * 1),
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          mainAxisExtent: 200,
        ),
        children: dummyMeals.map((e) {
          return CategoryScreenItem(
            color: e.color,
            title: e.title,
            id: e.id,
          );
        }).toList(),
      );
    } else if ((MediaQuery.of(context).size.width >= 500) &&
        MediaQuery.of(context).size.width < 900) {
      return GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          childAspectRatio: 3 / 2,
          maxCrossAxisExtent: (MediaQuery.of(context).size.width * 1) / 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          mainAxisExtent: 200,
        ),
        children: dummyMeals.map((e) {
          return CategoryScreenItem(
            color: e.color,
            title: e.title,
            id: e.id,
          );
        }).toList(),
      );
    } else {
      return GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          childAspectRatio: 3 / 2,
          maxCrossAxisExtent: (MediaQuery.of(context).size.width * 1) / 3,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          mainAxisExtent: 200,
        ),
        children: dummyMeals.map((e) {
          return CategoryScreenItem(
            color: e.color,
            title: e.title,
            id: e.id,
          );
        }).toList(),
      );
    }
  }
}
