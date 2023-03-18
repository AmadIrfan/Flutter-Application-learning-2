import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../single_page_application/model/transection.dart';

import '../single_page_application/cart_bars.dart';

class Carts extends StatelessWidget {
  const Carts({super.key, required this.tLists});
  final List<Transaction> tLists;
  List<Map<String, Object>> get _tCartList {
    return List.generate(7, (index) {
      final weekDate = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0.0;
      for (var obj in tLists) {
        if (obj.date.year == weekDate.year &&
            obj.date.day == weekDate.day &&
            obj.date.month == weekDate.month) {
          totalSum += obj.amount;
        }
      }
      return {'days': DateFormat.E().format(weekDate), 'amount': totalSum};
    }).reversed.toList();
  }

  double get totalAmount {
    // double totalSum = 0.0;
    return _tCartList.fold(
        0.0, (totalSum, element) => totalSum += (element['amount'] as double));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        color: Colors.grey,
        border: Border.all(),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _tCartList
            .map(
              (e) => CartBars(
                day: e['days'].toString(),
                amount: e['amount'] as double,
                per: totalAmount == 0.0
                    ? 0.0
                    : (e['amount'] as double) / totalAmount,
              ),
            )
            .toList(),
      ),
    );
  }
}
