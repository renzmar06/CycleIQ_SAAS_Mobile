import 'package:flutter/material.dart';

class LcContinueButton extends StatelessWidget {
  final bool enabled;
  final bool loading;
  final VoidCallback onTap;

  const LcContinueButton({
    super.key,
    required this.enabled,
    required this.loading,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled && !loading ? onTap : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 55,
        margin: const EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: enabled
              ? const LinearGradient(
                  colors: [Color(0xFF4CB96F), Color(0xFF1A73E8)],
                )
              : LinearGradient(
                  colors: [Colors.grey.shade300, Colors.grey.shade400],
                ),
        ),
        child: Center(
          child: loading
              ? const CircularProgressIndicator(color: Colors.white)
              : Text(
                  "I Agree & Continue",
                  style: TextStyle(
                    color: enabled ? Colors.white : Colors.grey.shade700,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
      ),
    );
  }
}
