import 'package:flutter/material.dart';

class ActiveBonuses extends StatelessWidget {
  const ActiveBonuses({super.key});

  @override
  Widget build(BuildContext context) {
    final bonuses = [
      {
        'title': 'EcoCorp Bonus',
        'subtitle': '10% extra points',
        'color': Colors.green,
      },
      {
        'title': 'GreenTech Promo',
        'subtitle': 'Free pickup coupon',
        'color': Colors.teal,
      },
      {
        'title': 'Recycle Week',
        'subtitle': '+50 points',
        'color': Colors.greenAccent,
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Active bonuses',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 110,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: bonuses.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final b = bonuses[index];
              return _BonusCard(
                title: b['title']!.toString(),
                subtitle: b['subtitle']!.toString(),
                color: b['color']! as Color,
              );
            },
          ),
        ),
      ],
    );
  }
}

class _BonusCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color color;

  const _BonusCard({
    required this.title,
    required this.subtitle,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade100),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 8),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              color: color.withOpacity(0.14),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(Icons.local_offer, color: color, size: 26),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),
                Text(subtitle, style: const TextStyle(color: Colors.grey)),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text(
                      'Use',
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
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
