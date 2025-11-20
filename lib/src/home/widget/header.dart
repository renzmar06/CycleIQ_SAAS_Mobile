import 'package:flutter/material.dart';
import '../../../../core/services/navigation.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello 👋",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            Text(
              "Welcome back!",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),

        GestureDetector(
          onTap: () => AppNav.to(context, "/profile"),
          child: CircleAvatar(
            radius: 26,
            backgroundColor: Colors.grey.shade200,
            backgroundImage: const AssetImage("assets/images/profileIcon.png"),
          ),
        ),
      ],
    );
  }
}
