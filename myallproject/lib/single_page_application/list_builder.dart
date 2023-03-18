import 'package:flutter/material.dart';
import '../single_page_application/carts.dart';
import '../single_page_application/model/transection.dart';
import '../windows/list_tr.dart';
import 'package:provider/provider.dart';

import '../single_page_application/add_transaction.dart';

class ListBuilders extends StatelessWidget {
  const ListBuilders({super.key});

  @override
  Widget build(BuildContext context) {
    final transactions = Provider.of<Trans>(context).transactionsList;
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          actions: [
            IconButton(
                onPressed: () {
                  _myShowModalBottomSheets(context);
                },
                icon: const Icon(Icons.add)),
          ],
          expandedHeight: 100,
          flexibleSpace: const FlexibleSpaceBar(
            title: Text('Transaction App'),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Card(
                child: Carts(
                  tLists: transactions,
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 1500,
                child: ListView.builder(
                  itemCount: transactions.length,
                  itemBuilder: (BuildContext context, int index) {
                    return TransactionListBuild(
                        id: transactions[index].id,
                        amount: transactions[index].amount,
                        date: transactions[index].date,
                        title: transactions[index].title);
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _myShowModalBottomSheets(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: ((context) {
        return GestureDetector(
          onTap: null,
          child: const AddTransaction(),
        );
      }),
    );
  }
}
