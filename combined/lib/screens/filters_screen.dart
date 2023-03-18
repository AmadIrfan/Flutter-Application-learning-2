import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});
  static const routName = 'filterScreen';

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool isGlutenFree = false;
  bool isVegan = false;
  bool isVegetarian = false;
  bool isLactoseFree = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        width: double.infinity,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Adjust your meal Category\'s',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              SwitchListTile.adaptive(
                title: const Text('GlutenFree'),
                subtitle: const Text('only contain GlutenFree '),
                value: isGlutenFree,
                onChanged: (val) {
                  setState(() {
                    isGlutenFree = val;
                  });
                },
              ),
              SwitchListTile.adaptive(
                title: const Text('Vegetarian'),
                subtitle: const Text('only contain Vegetarian '),
                value: isVegetarian,
                onChanged: (val) {
                  setState(() {
                    isVegetarian = val;
                  });
                },
              ),
              SwitchListTile.adaptive(
                title: const Text('Vegan'),
                subtitle: const Text('only contain Vegan '),
                value: isVegan,
                onChanged: (val) {
                  setState(() {
                    isVegan = val;
                  });
                },
              ),
              SwitchListTile.adaptive(
                title: const Text('LactoseFree'),
                subtitle: const Text('only contain LactoseFree '),
                value: isLactoseFree,
                onChanged: (val) {
                  setState(() {
                    isLactoseFree = val;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
