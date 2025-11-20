import 'package:flutter/material.dart';

class LogoutButton extends StatelessWidget {
  final VoidCallback onLogout;

  const LogoutButton({super.key, required this.onLogout});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onLogout,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red.shade600,
        elevation: 0,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: const Text(
        "Logout",
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
