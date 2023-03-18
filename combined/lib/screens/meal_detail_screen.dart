import 'package:combined/model/dummy_meal.dart';
import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

class MealDetailScreen extends StatefulWidget {
  const MealDetailScreen({super.key});
  static const routeName = '/mealDetailScreen';
  @override
  State<MealDetailScreen> createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final itemsData = ModalRoute.of(context)!.settings.arguments as String;
    final data = mealsList.firstWhere(
      (e) {
        return e.id == itemsData;
      },
    );
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: data.id,
                child: Image.network(
                  data.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                data.title,
              ),
              centerTitle: true,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                containerMaker(data.steps, 'Steps'),
                containerMaker(data.ingredients, 'ingredients'),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop(
            data.id,
          );
        },
        child: const Icon(Icons.delete),
      ),
    );
  }

  Widget containerMaker(List<String> data, String name) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 117, 97, 34),
      ),
      height: 400,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
                color: Colors.amber),
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            height: 300,
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            width: double.infinity,
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                int num = index + 1;
                return Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Colors.amber,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      "$num : ${data[index]}",
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
