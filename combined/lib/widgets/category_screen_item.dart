import 'package:combined/screens/page_detail.dart';
import 'package:flutter/material.dart';

class CategoryScreenItem extends StatelessWidget {
  const CategoryScreenItem({
    super.key,
    required this.color,
    required this.title,
    required this.id,
  });
  final String id;
  final String title;
  final Color color;
  void _selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(NewPageDetail.routeName,
        arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: () => _selectCategory(context),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              colors: [
                color.withOpacity(0.7),
                color,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            // color: color,
          ),
          child: Container(
            alignment: Alignment.center,
            child: Text(title),
          ),
        ),
      ),
    );
  }
}
