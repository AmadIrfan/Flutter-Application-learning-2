import 'package:flutter/material.dart';

class Transaction with ChangeNotifier {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  Transaction(
      {required this.id,
      required this.amount,
      required this.title,
      required this.date});
}

class Trans with ChangeNotifier {
  final List<Transaction> _transactions = [
    Transaction(
        id: DateTime.now().toString(),
        amount: 123.3,
        title: 'T1',
        date: DateTime.now()),
    Transaction(
        id: DateTime.now().toString(),
        amount: 124.3,
        title: 'T2',
        date: DateTime.now()),
    Transaction(
        id: DateTime.now().toString(),
        amount: 125.3,
        title: 'T3',
        date: DateTime.now()),
    Transaction(
        id: DateTime.now().toString(),
        amount: 126.3,
        title: 'T4',
        date: DateTime.now()),
    Transaction(
        id: DateTime.now().toString(),
        amount: 127.3,
        title: 'T5',
        date: DateTime.now()),
  ];

  List<Transaction> get transList {
    return _transactions;
  }

  List<Transaction> get transactionsList {
    return _transactions
        .where(
          (element) => element.date.isAfter(
            DateTime.now().subtract(
              const Duration(days: 7),
            ),
          ),
        )
        .toList();
  }

  void addDataInList(String title, double amount, DateTime date) {
    Transaction temp = Transaction(
      id: DateTime.now().toString(),
      amount: amount,
      date: date,
      title: title,
    );
    _transactions.add(temp);
    notifyListeners();
  }

  void deleteItem(String id) {
    // ignore: list_remove_unrelated_type
    _transactions.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
