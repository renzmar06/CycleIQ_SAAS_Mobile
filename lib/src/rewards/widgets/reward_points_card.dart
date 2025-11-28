import 'package:flutter/material.dart';

class RewardPointsCard extends StatelessWidget {
  const RewardPointsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.1),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            "Total Points",
            style: TextStyle(color: Colors.white70, fontSize: 16),
          ),
          const SizedBox(height: 8),
          const Icon(Icons.bolt, color: Colors.greenAccent, size: 36),
          const Text(
            "0",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            "1000 points to Silver",
            style: TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: 0.0,
              backgroundColor: Colors.white24,
              color: Colors.greenAccent,
              minHeight: 8,
            ),
          ),
        ],
      ),
    );
  }
}
