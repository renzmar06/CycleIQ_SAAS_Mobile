import 'package:flutter/material.dart';
import 'ic_stat_box.dart';
import 'ic_generate_button.dart';

class ICPersonalCard extends StatelessWidget {
  const ICPersonalCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(blurRadius: 12, color: Colors.black.withOpacity(0.06)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: const [
              Icon(Icons.emoji_events_outlined, color: Colors.green),
              SizedBox(width: 8),
              Text(
                "This Month Impact",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ],
          ),

          const SizedBox(height: 6),
          const Text(
            "Current Month",
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),

          const SizedBox(height: 16),

          // Stats
          Row(
            children: const [
              ICStatBox(label: "kg CO₂", value: "0", icon: Icons.eco),
              SizedBox(width: 12),
              ICStatBox(
                label: "lbs Recycled",
                value: "0",
                icon: Icons.show_chart,
              ),
            ],
          ),

          ICGenerateButton(onTap: () {}),
          const SizedBox(height: 12),

          // Lifetime card
          Container(
            margin: const EdgeInsets.only(top: 16),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  blurRadius: 12,
                  color: Colors.black.withOpacity(0.05),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Icon(Icons.emoji_events_outlined, color: Colors.green),
                    SizedBox(width: 8),
                    Text(
                      "Lifetime Impact",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                const Text(
                  "All Time",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                const SizedBox(height: 16),
                Row(
                  children: const [
                    ICStatBox(label: "kg CO₂", value: "0", icon: Icons.eco),
                    SizedBox(width: 12),
                    ICStatBox(
                      label: "Points",
                      value: "0",
                      icon: Icons.flash_on,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
