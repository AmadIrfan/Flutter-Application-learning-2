import 'dart:math';

import 'package:flutter/material.dart';

class AnswerPage extends StatefulWidget {
  const AnswerPage({
    super.key,
    required this.ansString,
    required this.tag,
    required this.questionInc,
  });
  final String ansString;
  final Function questionInc;
  final String tag;

  @override
  State<AnswerPage> createState() => _AnswerPageState();
}

class _AnswerPageState extends State<AnswerPage> {
  late Color _color;
  static const List<Color> _colorList = [
    Colors.green,
    Colors.amber,
    Colors.cyanAccent,
    Colors.blueGrey,
  ];
  @override
  void initState() {
    _color = _colorList[Random().nextInt(_colorList.length)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(border: Border.all()),
      child: ListTile(
        onTap: () {
          widget.questionInc();
        },
        leading: CircleAvatar(
          backgroundColor: _color,
          radius: 30,
          child: Text(
            widget.tag,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        title: Text(widget.ansString),
      ),
    );
  }
}
