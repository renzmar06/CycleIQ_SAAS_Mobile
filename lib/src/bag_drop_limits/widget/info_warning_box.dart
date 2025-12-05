import 'package:flutter/material.dart';

class InfoWarningBox extends StatelessWidget {
  const InfoWarningBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF2E5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFFFD5B2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.error_outline, color: Colors.orange),
              SizedBox(width: 10),
              Text(
                "What Happens When You Exceed?",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            'If you exceed the Bag-Drop limit for any material, a modal will display:',
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.orange),
            ),
            child: const Text(
              '"Above Program Limit — Excess Paid at Scrap Value"',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 14),
          const Text(
            "The system will apply scrap value to the EXCESS ONLY. Materials within the limit still receive full CRV value.",
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
