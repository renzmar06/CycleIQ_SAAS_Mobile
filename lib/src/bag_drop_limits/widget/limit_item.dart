import 'package:flutter/material.dart';

class LimitItem extends StatelessWidget {
  final Map<String, dynamic> data;

  const LimitItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Text(data['icon'], style: const TextStyle(fontSize: 26)),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              data['name'],
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          Text(
            data['limit'],
            style: const TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
