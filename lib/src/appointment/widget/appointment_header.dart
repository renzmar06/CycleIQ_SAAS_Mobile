import 'package:flutter/material.dart';

class AppointmentHeader extends StatelessWidget {
  const AppointmentHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Schedule a Pickup",
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }
}
