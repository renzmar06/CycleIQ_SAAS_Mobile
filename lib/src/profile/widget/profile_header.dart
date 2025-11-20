import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  final String name;
  final String email;

  const ProfileHeader({super.key, required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Hello, $name 👋",
          style: const TextStyle(
            fontSize: 18,
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          "Manage Your Account",
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          email,
          style: const TextStyle(fontSize: 14, color: Colors.black54),
        ),
      ],
    );
  }
}
