import 'package:flutter/material.dart';

class EBCImportantNote extends StatelessWidget {
  const EBCImportantNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.yellow.shade50,
        border: Border.all(color: Colors.yellow.shade700),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.info_outline, color: Colors.orange.shade700),
          const SizedBox(width: 10),
          const Expanded(
            child: Text(
              "This count helps us verify your drop-off. Any discrepancies may delay processing.",
              style: TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
