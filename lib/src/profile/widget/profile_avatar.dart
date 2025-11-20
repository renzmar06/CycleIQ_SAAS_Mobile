import 'dart:io';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final String? avatarUrl;
  final VoidCallback onEdit;

  const ProfileAvatar({
    super.key,
    required this.avatarUrl,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    ImageProvider avatarProvider;

    // --- Decide image source ---
    if (avatarUrl != null && avatarUrl!.startsWith("http")) {
      avatarProvider = NetworkImage(avatarUrl!);
    } else if (avatarUrl != null && File(avatarUrl!).existsSync()) {
      avatarProvider = FileImage(File(avatarUrl!));
    } else {
      avatarProvider = const AssetImage("assets/images/profileIcon.png");
    }

    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey.shade300,
              backgroundImage: avatarProvider,
            ),

            // EDIT BUTTON
            GestureDetector(
              onTap: onEdit,
              child: Container(
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.edit, size: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
