// FILE: lib/src/community/widgets/impact_rank_card.dart
import 'package:flutter/material.dart';

class ImpactRankCard extends StatelessWidget {
  const ImpactRankCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        // gradient: const LinearGradient(
        //   colors: [Color(0xFFE8FFF3), Color(0xFFD6FBE8)],
        // ),
        color: Colors.white.withOpacity(.1),
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 8),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Your Impact Rank', style: TextStyle(color: Colors.white)),
                SizedBox(height: 8),
                Text(
                  '#42',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 54,
            width: 54,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.emoji_events, color: Colors.yellow),
          ),
        ],
      ),
    );
  }
}
