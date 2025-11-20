import 'package:flutter/material.dart';
import 'transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List transactions;

  const TransactionList({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    if (transactions.isEmpty) {
      return const Center(
        child: Text(
          "No transactions found",
          style: TextStyle(color: Colors.black54),
        ),
      );
    }

    return ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (_, i) {
        final item = transactions[i];
        return TransactionItem(
          title: item["title"],
          date: item["date"],
          amount: item["amount"],
          isCredit: item["isCredit"],
        );
      },
    );
  }
}
