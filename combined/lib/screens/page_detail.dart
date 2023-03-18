import 'package:combined/model/dummy_meal.dart';
import 'package:combined/model/meal.dart';
import 'package:combined/widgets/item_detail_screen.dart';
import 'package:flutter/material.dart';

class NewPageDetail extends StatefulWidget {
  const NewPageDetail({super.key});
  static const routeName = '/newpage';

  @override
  State<NewPageDetail> createState() => _NewPageDetailState();
}

class _NewPageDetailState extends State<NewPageDetail> {
  late final String title;
  late final String id;
  late final List<Meal> mealData;
  bool _initData = false;
  @override
  void didChangeDependencies() {
    if (!_initData) {
      final getData =
          ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
      title = getData['title'].toString();
      id = getData['id'].toString();
      mealData = mealsList.where((e) {
        return e.categories.contains(id);
      }).toList();
      _initData = false;
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemCount: mealData.length,
        itemBuilder: (BuildContext context, int index) {
          return ItemDetailScreen(
            title: mealData[index].title,
            id: mealData[index].id,
            imageUrl: mealData[index].imageUrl,
            duration: mealData[index].duration,
            affordability: mealData[index].affordability,
            complexity: mealData[index].complexity,
            removeItem: removeItems,
          );
        },
      ),
    );
  }

  void removeItems(String id) {
    setState(() {
      mealData.removeWhere((element) => element.id == id);
    });
  }
}
