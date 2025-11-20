import 'package:flutter/material.dart';

class ContinueButton extends StatelessWidget {
  final bool enabled;
  final VoidCallback onPressed;

  const ContinueButton({
    super.key,
    required this.enabled,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: enabled ? onPressed : null,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: Colors.green,
        disabledBackgroundColor: Colors.grey.shade300,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: const Text(
        "Continue",
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
