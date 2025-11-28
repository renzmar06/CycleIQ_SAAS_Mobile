import 'package:flutter/material.dart';

class RewardTierBenefits extends StatelessWidget {
  const RewardTierBenefits({super.key});

  @override
  Widget build(BuildContext context) {
    final benefits = [
      "Earn 1 point per \$1 recycled",
      "Access to basic challenges",
      "Monthly bonus opportunities",
      "Standard processing priority",
    ];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Your Tier Benefits",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 14),

          ...benefits.map(
            (b) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                children: [
                  const Icon(Icons.check_circle, size: 20, color: Colors.green),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      b,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
