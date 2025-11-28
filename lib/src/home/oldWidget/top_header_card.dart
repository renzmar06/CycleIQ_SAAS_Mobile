import 'package:flutter/material.dart';
import '../../../../core/services/navigation.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    // Minimal black/white/green style
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Left side texts
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Hello 👋",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            SizedBox(height: 4),
            Text(
              "Welcome back!",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 6),
            Text(
              "ID: #A12345", // Replace with real id if available
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),

        // Right side icons
        Row(
          children: [
            // QR button
            GestureDetector(
              onTap: () {
                // handle QR action
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.qr_code,
                  size: 20,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(width: 10),

            // Notifications
            GestureDetector(
              onTap: () {
                // navigate to notifications page if exists
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.notifications_none,
                  size: 20,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(width: 10),

            // Profile avatar
            GestureDetector(
              onTap: () => AppNav.push(context, "/profile"),
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey.shade200,
                backgroundImage: const AssetImage(
                  "assets/images/profileIcon.png",
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
