import 'package:flutter/material.dart';

class ICTabs extends StatelessWidget {
  final int selected;
  final Function(int) onChange;

  const ICTabs({super.key, required this.selected, required this.onChange});

  @override
  Widget build(BuildContext context) {
    final tabs = [
      ("Personal", Icons.person_rounded),
      ("Donations", Icons.favorite_rounded),
      ("Organizations", Icons.apartment_rounded),
      ("Sponsors", Icons.star_rounded),
    ];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(tabs.length, (i) {
          final active = selected == i;

          return GestureDetector(
            onTap: () => onChange(i),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: active ? Colors.green.withOpacity(0.15) : Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: active ? Colors.green : Colors.grey.shade300,
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    tabs[i].$2,
                    color: active ? Colors.green : Colors.grey,
                    size: 18,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    tabs[i].$1,
                    style: TextStyle(
                      color: active ? Colors.green : Colors.black87,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
