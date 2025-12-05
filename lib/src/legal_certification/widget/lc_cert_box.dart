import 'package:flutter/material.dart';

class LcCertBox extends StatelessWidget {
  const LcCertBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(vertical: 40),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF4CB96F), Color(0xFF1A73E8)],
              ),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Icon(Icons.scale, size: 60, color: Colors.white),
          ),
          SizedBox(height: 12),
          Text(
            "Certification Required",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
