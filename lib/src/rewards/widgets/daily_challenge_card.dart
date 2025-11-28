import 'package:flutter/material.dart';

class DailyChallengeCard extends StatelessWidget {
  const DailyChallengeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1DB954),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Daily Challenge",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            "Recycle 10 lbs of materials today",
            style: TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 16),

          const Text(
            "Progress",
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
          const SizedBox(height: 4),

          LinearProgressIndicator(
            value: 0.32,
            backgroundColor: Colors.white24,
            color: Colors.black,
            minHeight: 8,
          ),
          const SizedBox(height: 8),
          const Text("3.2 / 10 lbs", style: TextStyle(color: Colors.white)),

          const SizedBox(height: 16),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Reward",
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
              Row(
                children: [
                  Icon(Icons.bolt, color: Colors.yellowAccent),
                  SizedBox(width: 4),
                  Text(
                    "+50 Points",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
