import 'package:flutter/material.dart';

class PickupSummaryCard extends StatelessWidget {
  final DateTime date;
  final String time;

  const PickupSummaryCard({super.key, required this.date, required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.event, color: Colors.white),
          ),
          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Pickup Summary",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 4),
                Text(
                  "${date.day}-${date.month}-${date.year} • $time",
                  style: const TextStyle(color: Colors.black54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
