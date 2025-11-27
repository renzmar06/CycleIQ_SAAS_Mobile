// FILE: lib/src/community/widgets/impact_row.dart
import 'package:flutter/material.dart';

class ImpactRow extends StatelessWidget {
  const ImpactRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(
          child: _ImpactCard(
            title: 'CO₂ Saved',
            value: '12,450 lbs',
            icon: Icons.eco,
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: _ImpactCard(
            title: 'Recycled',
            value: '8,920 lbs',
            icon: Icons.trending_up,
          ),
        ),
      ],
    );
  }
}

class _ImpactCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const _ImpactCard({
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: Colors.green),
              ),
              const SizedBox(width: 8),
              Text(title, style: const TextStyle(color: Colors.black54)),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
