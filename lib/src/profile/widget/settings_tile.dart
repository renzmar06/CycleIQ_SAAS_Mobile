import 'package:flutter/material.dart';

class SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;

  const SettingsTile({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.black87),
          const SizedBox(width: 16),
          Text(
            title,
            style: const TextStyle(fontSize: 15, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
