import 'package:combined/model/dummy_meal.dart';
import 'package:combined/model/meal.dart';
import 'package:combined/screens/meal_detail_screen.dart';
import 'package:flutter/material.dart';

class ItemDetailScreen extends StatelessWidget {
  const ItemDetailScreen({
    super.key,
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.duration,
    required this.affordability,
    required this.complexity,
    required this.removeItem,
  });
  final String id;
  final String imageUrl;
  final String title;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final Function removeItem;
  String get affordabilityText {
    switch (affordability) {
      case Affordability.affordable:
        return "affordable";
      case Affordability.luxurious:
        return 'luxurious';
      case Affordability.pricey:
        return 'pricey';
      default:
        return 'Unknown';
    }
  }

  String get complexityText {
    switch (complexity) {
      case Complexity.challenging:
        return "challenging";
      case Complexity.hard:
        return "hard";
      case Complexity.simple:
        return "simple";
      default:
        return "unknown";
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Column(
          children: [
            InkWell(
              onTap: (() {
                Navigator.of(context)
                    .pushNamed(MealDetailScreen.routeName, arguments: id)
                    .then(
                  (value) {
                    if (value != null) {
                      removeItem(
                        value.toString(),
                      );
                    }
                  },
                );
              }),
              child: Card(
                elevation: 5,
                margin: const EdgeInsets.all(5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Hero(
                            tag: id,
                            child: FadeInImage(
                              placeholder: const AssetImage(
                                'assets/images/289 product-placeholder.png',
                              ),
                              image: NetworkImage(
                                imageUrl,
                              ),
                              height: 350,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          right: 20,
                          child: Container(
                            width: 250,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              color: Colors.black54,
                            ),
                            child: Text(
                              title,
                              style: const TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          rowBuilder('$duration min ', Icons.schedule),
                          SizedBox(
                            width: constraints.maxWidth * 0.02,
                          ),
                          rowBuilder(
                            affordabilityText,
                            Icons.attach_money,
                          ),
                          SizedBox(
                            width: constraints.maxWidth * 0.02,
                          ),
                          rowBuilder(
                            complexityText,
                            Icons.work,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget rowBuilder(String text, IconData icon) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(
          width: 6,
        ),
        Text(text),
      ],
    );
  }
}
