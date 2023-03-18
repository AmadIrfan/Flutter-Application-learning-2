import 'package:combined/screens/drawer.dart';
import 'package:flutter/material.dart';

import '../screens/category_screen.dart';
import '../screens/favorite_screen.dart';

class TabBarScreen extends StatelessWidget {
  const TabBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Meal App'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: "Category",
              ),
              Tab(
                icon: Icon(Icons.favorite),
                text: "Favorite",
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            CategoryScreen(),
            FavoriteScreen(),
          ],
        ),
        drawer: const Drawer(
          child: Drawers(),
        ),
      ),
    );
  }
}
