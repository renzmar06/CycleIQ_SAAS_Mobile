import 'package:flutter/material.dart';

class EcoStats extends StatelessWidget {
  const EcoStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _Stat("12kg", "Recycled"),
          _Stat("4kg", "CO₂ Saved"),
          _Stat("2", "Pickups"),
        ],
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  final String value;
  final String label;

  const _Stat(this.value, this.label);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        Text(label, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}
