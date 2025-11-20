import 'package:cycleiq_saas_mobile/src/transaction/widget/filter_chip_item.dart';
import 'package:cycleiq_saas_mobile/src/transaction/widget/transaction_list.dart';
import 'package:cycleiq_saas_mobile/src/transaction/widget/wallet_card.dart';
import 'package:flutter/material.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  String selectedFilter = "All";

  final List<Map<String, dynamic>> allTransactions = [
    {
      "title": "Plastic Waste Pickup",
      "date": "12 Feb 2025",
      "amount": "+ ₹150",
      "isCredit": true,
      "status": "Completed",
    },
    {
      "title": "E-Waste Disposal",
      "date": "08 Feb 2025",
      "amount": "- ₹299",
      "isCredit": false,
      "status": "Failed",
    },
    {
      "title": "Organic Pickup",
      "date": "05 Feb 2025",
      "amount": "+ ₹90",
      "isCredit": true,
      "status": "Pending",
    },
  ];

  List<String> filters = ["All", "Completed", "Pending", "Failed"];

  @override
  Widget build(BuildContext context) {
    List filteredList = selectedFilter == "All"
        ? allTransactions
        : allTransactions
              .where((item) => item["status"] == selectedFilter)
              .toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Transactions",
          style: TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const WalletCard(),
            const SizedBox(height: 30),

            // FILTER ROW
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: filters
                  .map(
                    (type) => FilterChipItem(
                      text: type,
                      selected: selectedFilter == type,
                      onTap: () {
                        setState(() {
                          selectedFilter = type;
                        });
                      },
                    ),
                  )
                  .toList(),
            ),

            const SizedBox(height: 25),
            const Text(
              "Recent Transactions",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),

            // LIST
            Expanded(child: TransactionList(transactions: filteredList)),
          ],
        ),
      ),
    );
  }
}
