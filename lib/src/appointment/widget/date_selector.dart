import 'package:flutter/material.dart';

class DateSelector extends StatelessWidget {
  final DateTime selectedDate;
  final ValueChanged<DateTime> onDateSelected;

  const DateSelector({
    super.key,
    required this.selectedDate,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    final days = List.generate(7, (i) => DateTime.now().add(Duration(days: i)));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Select Date",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 14),

        SizedBox(
          height: 95,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: days.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (_, index) {
              final day = days[index];
              final isSelected =
                  day.day == selectedDate.day &&
                  day.month == selectedDate.month;

              return GestureDetector(
                onTap: () => onDateSelected(day),
                child: Container(
                  width: 75,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: isSelected ? Colors.green : Colors.grey.shade100,
                  ),
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        [
                          "Mon",
                          "Tue",
                          "Wed",
                          "Thu",
                          "Fri",
                          "Sat",
                          "Sun",
                        ][day.weekday - 1],
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black87,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "${day.day}",
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black87,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
