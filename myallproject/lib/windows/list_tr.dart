import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../single_page_application/model/transection.dart';

class TransactionListBuild extends StatefulWidget {
  const TransactionListBuild(
      {super.key,
      required this.id,
      required this.amount,
      required this.date,
      required this.title});
  final String title;
  final String id;
  final DateTime date;
  final double amount;

  @override
  State<TransactionListBuild> createState() => _TransactionListBuildState();
}

class _TransactionListBuildState extends State<TransactionListBuild> {
  Color bgCr = Colors.redAccent;
  List<Color> cList = [
    Colors.amber,
    Colors.white30,
    Colors.green,
    Colors.deepPurple,
    Colors.orangeAccent,
    Colors.pinkAccent,
    Colors.teal,
    Colors.purple,
    Colors.lightGreen,
    Colors.lime,
    Colors.limeAccent,
    Colors.pink,
    Colors.yellow,
    Colors.lightBlue,
  ];

  @override
  void initState() {
    bgCr = cList[Random().nextInt(cList.length)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final deleteData = Provider.of<Trans>(context);
    return Card(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: CircleAvatar(
              key: ValueKey(widget.id),
              backgroundColor: bgCr,
              radius: 30,
              child: Expanded(
                child: Text(
                  widget.amount.toStringAsFixed(2),
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.title,
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                DateFormat.yMEd().format(widget.date),
              ),
            ],
          ),
          const Spacer(),
          CircleAvatar(
            backgroundColor: Colors.red,
            child: IconButton(
              onPressed: () {
                deleteData.deleteItem(widget.id);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('delete Item '),
                  ),
                );
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
