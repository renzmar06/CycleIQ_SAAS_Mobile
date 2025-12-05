import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class QRHeader extends StatelessWidget {
  final String? userId;
  const QRHeader({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () => context.pop(),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white.withOpacity(0.2),
                  shape: BoxShape.rectangle,
                ),
                child: const Icon(Icons.arrow_back, color: Colors.white),
              ),
            ),
            const SizedBox(width: 12),
            const Text(
              "My Universal QR",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),

        // Avatar
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withOpacity(0.2),
          ),
          child: const Icon(Icons.person, color: Colors.white, size: 50),
        ),

        const SizedBox(height: 14),
        Text(
          "ID: $userId",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 6),
        const Text(
          "This QR identifies your bags, tickets, and rewards\n"
          "Show this at drop-off points or scan into bags",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white70),
        ),
      ],
    );
  }
}
