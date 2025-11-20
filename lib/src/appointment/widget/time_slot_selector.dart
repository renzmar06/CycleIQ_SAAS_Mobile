import 'package:flutter/material.dart';

class TimeSlotSelector extends StatelessWidget {
  final String selected;
  final ValueChanged<String> onSelected;

  const TimeSlotSelector({
    super.key,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final slots = [
      "09:00 AM",
      "11:00 AM",
      "01:00 PM",
      "03:00 PM",
      "05:00 PM",
      "07:00 PM",
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Select Time",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 14),

        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: slots.map((slot) {
            final isSelected = selected == slot;

            return GestureDetector(
              onTap: () => onSelected(slot),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 18,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: isSelected ? Colors.green : Colors.grey.shade100,
                  border: Border.all(
                    color: isSelected ? Colors.green : Colors.grey.shade400,
                  ),
                ),
                child: Text(
                  slot,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
