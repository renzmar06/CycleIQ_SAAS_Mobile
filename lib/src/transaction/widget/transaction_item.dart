import 'package:flutter/material.dart';

class TransactionItem extends StatelessWidget {
  final String title;
  final String date;
  final String amount;
  final bool isCredit;

  const TransactionItem({
    super.key,
    required this.title,
    required this.date,
    required this.amount,
    required this.isCredit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(
            isCredit
                ? Icons.arrow_downward_rounded
                : Icons.arrow_upward_rounded,
            color: isCredit ? Colors.green : Colors.black87,
            size: 28,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  date,
                  style: const TextStyle(color: Colors.black54, fontSize: 12),
                ),
              ],
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isCredit ? Colors.green.shade700 : Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
