import 'package:flutter/material.dart';
import 'settings_item.dart';

class SettingsCard extends StatelessWidget {
  final List<SettingsItem> items;
  const SettingsCard({required this.items, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(children: items),
    );
  }
}
