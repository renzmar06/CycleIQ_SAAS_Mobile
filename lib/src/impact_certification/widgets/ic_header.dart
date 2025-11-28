import 'package:flutter/material.dart';
import '../../../../core/services/navigation.dart';

class ICHeader extends StatelessWidget {
  const ICHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF2ECC71), Color(0xFF1ABC9C)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(26),
          bottomRight: Radius.circular(26),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Back btn + title
          Row(
            children: [
              GestureDetector(
                onTap: () => AppNav.back(context),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.arrow_back, color: Colors.white),
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                "Impact Certificates",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 6),
          const Text(
            "Generate verified impact certificates",
            style: TextStyle(color: Colors.white70),
          ),

          const SizedBox(height: 26),

          // Verified card
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Column(
              children: [
                Icon(
                  Icons.emoji_events_outlined,
                  color: Colors.white,
                  size: 38,
                ),
                SizedBox(height: 8),
                Text(
                  "Verified by CycleIQ",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "All certificates include QR verification",
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
