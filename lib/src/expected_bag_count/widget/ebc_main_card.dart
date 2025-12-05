import 'package:flutter/material.dart';
import 'ebc_number_picker.dart';
import 'ebc_quick_select_grid.dart';

class EBCMainCard extends StatelessWidget {
  const EBCMainCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "How many bags are you dropping off?",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 6),
          Text(
            "This helps us verify your drop-off",
            style: TextStyle(fontSize: 14, color: Colors.black54),
          ),
          SizedBox(height: 20),
          Text(
            "Expected Bag Count",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 10),

          EBCNumberPicker(),
          SizedBox(height: 20),

          EBCQuickSelectGrid(),
        ],
      ),
    );
  }
}
