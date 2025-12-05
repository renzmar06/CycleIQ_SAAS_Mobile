import 'package:cycleiq_saas_mobile/core/services/navigation.dart';
import 'package:flutter/material.dart';

class BDSStartSessionButton extends StatelessWidget {
  const BDSStartSessionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        // gradient: LinearGradient(
        //   colors: [Color(0xFF22C575), Color(0xFF1FB2CE)],
        // ),
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => AppNav.push(context, '/register-bag'),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 18),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF22C575), Color(0xFF1FB2CE)],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  "Start Bag-Drop Session",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () => AppNav.push(context, '/bag-details/:12345678'),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 18),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF22C575), Color(0xFF1FB2CE)],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  "generate QR",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
