import 'dart:math';

import 'package:flutter/material.dart';

class CartBars extends StatefulWidget {
  const CartBars({
    super.key,
    required this.amount,
    required this.day,
    required this.per,
  });
  final String day;
  final double amount;
  // ignore: prefer_typing_uninitialized_variables
  final double per;

  @override
  State<CartBars> createState() => _CartBarsState();
}

class _CartBarsState extends State<CartBars> {
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
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 20,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Text(widget.day),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          width: 20,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              width: 2,
              color: Colors.black,
            ),
          ),
          child: Stack(
            children: [
              Container(
                width: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                ),
                // ),
                child: FractionallySizedBox(
                  heightFactor: widget.per,
                  child: Container(
                    alignment: Alignment.topCenter,
                    width: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: bgCr,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 20,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Text(
            widget.amount.toStringAsFixed(2),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
