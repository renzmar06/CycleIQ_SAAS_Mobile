import 'package:flutter/material.dart';

class FilterChipItem extends StatelessWidget {
  final String text;
  final bool selected;
  final VoidCallback onTap;

  const FilterChipItem({
    super.key,
    required this.text,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? Colors.green.withOpacity(.1) : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: selected ? Colors.green : Colors.grey.shade400,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: selected ? Colors.green.shade800 : Colors.black87,
          ),
        ),
      ),
    );
  }
}
