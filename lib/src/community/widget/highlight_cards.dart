// FILE: lib/src/community/widgets/highlight_cards.dart
import 'package:flutter/material.dart';

class HighlightCards extends StatelessWidget {
  const HighlightCards({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      {'label': 'Active Members', 'value': '1247', 'color': Colors.blue},
      {'label': 'Donations', 'value': '85', 'color': Colors.red},
      {'label': 'Leaders', 'value': '', 'color': Colors.green},
      {'label': 'Impact', 'value': '', 'color': Colors.orange},
      {'label': 'Certs', 'value': '', 'color': Colors.purple},
    ];

    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: items.map((it) {
        return _HighlightCard(
          label: it['label'] as String,
          value: it['value'] as String,
          color: it['color'] as Color,
        );
      }).toList(),
    );
  }
}

class _HighlightCard extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _HighlightCard({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color.withOpacity(0.9), color.withOpacity(0.7)],
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 6),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: Colors.white)),
          const SizedBox(height: 8),
          Text(
            value.isEmpty ? '-' : value,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
