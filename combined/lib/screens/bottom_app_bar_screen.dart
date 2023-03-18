import 'package:flutter/material.dart';

import '../screens/category_screen.dart';
import '../screens/favorite_screen.dart';

class BottomAppBarScreen extends StatefulWidget {
  const BottomAppBarScreen({super.key});

  @override
  State<BottomAppBarScreen> createState() => _BottomAppBarScreenState();
}

class _BottomAppBarScreenState extends State<BottomAppBarScreen> {
  int index = 0;
  final List<Map<String, dynamic>> _page = [
    {"page": const CategoryScreen(), "name": "Meal"},
    {"page": const FavoriteScreen(), "name": "Favorite"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
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
      ),
      body: _page[index]['page'],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        mouseCursor: MouseCursor.defer,
        // backgroundColor: Colors.red,
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color.fromARGB(136, 221, 217, 217),
        showUnselectedLabels: true,
        currentIndex: index,
        onTap: (indic) {
          setState(() {
            index = indic;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.category),
            label: _page[0]["name"].toString(),
            backgroundColor: Theme.of(context).primaryColor,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.favorite),
            label: _page[1]['name'].toString(),
            backgroundColor: Theme.of(context).primaryColor,
          ),
        ],
      ),
      drawer: const Drawer(),
    );
  }
}
