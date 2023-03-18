import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import './model/transection.dart';

// ignore: must_be_immutable
class AddTransaction extends StatefulWidget {
  const AddTransaction({
    super.key,
    //  required this.addDataInList
  });
  // final Function addDataInList;
  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final _titleController = TextEditingController();

  final _priceController = TextEditingController();
  DateTime? date;

  void _selectDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    ).then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        date = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(
              label: Text("data"),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: _priceController,
            decoration: const InputDecoration(
              label: Text("data"),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Text("Select Date :"),
              TextButton.icon(
                onPressed: _selectDate,
                icon: const Icon(Icons.date_range),
                label: Text(
                  date == null
                      ? "no Date Selected "
                      : DateFormat.yMEd().format(date!),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton.icon(
            onPressed: () {
              if (_priceController.text.isEmpty ||
                  _titleController.text.isEmpty ||
                  date == null) {
                return;
              } else {
                double amu = double.parse(_priceController.text);

                Provider.of<Trans>(context, listen: false)
                    .addDataInList(_titleController.text, amu, date!);
                Navigator.of(context).pop();
              }
            },
            icon: const Icon(Icons.save),
            label: const Text("Add Transaction"),
          ),
        ],
      ),
    );
  }
}
