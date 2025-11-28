import 'package:flutter/material.dart';
import 'ic_stat_box.dart';
import 'ic_generate_button.dart';

class ICOrgCard extends StatelessWidget {
  const ICOrgCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(blurRadius: 12, color: Colors.black.withOpacity(0.06)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.apartment_rounded, color: Colors.green),
              SizedBox(width: 8),
              Text(
                "Total Donations",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 6),
          const Text("All Time", style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 16),
          Row(
            children: const [
              ICStatBox(
                label: "\$ Donated",
                value: "0",
                icon: Icons.attach_money,
              ),
              SizedBox(width: 12),
              ICStatBox(label: "People Helped", value: "0", icon: Icons.people),
            ],
          ),
          ICGenerateButton(onTap: () {}),
        ],
      ),
    );
  }
}
