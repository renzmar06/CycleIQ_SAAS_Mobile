import 'package:flutter/material.dart';

class ICGenerateButton extends StatelessWidget {
  final VoidCallback onTap;
  const ICGenerateButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 12),
        padding: const EdgeInsets.symmetric(vertical: 14),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF2ECC71), Color(0xFF1ABC9C)],
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Text(
          "Generate Certificate",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
