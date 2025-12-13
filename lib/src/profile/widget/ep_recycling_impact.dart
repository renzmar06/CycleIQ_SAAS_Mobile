import 'package:flutter/material.dart';

class EPRecyclingImpact extends StatelessWidget {
  final String totalBags;
  final String kgCo2Saved;
  final String totalEarned;
  const EPRecyclingImpact({
    super.key,
    required this.totalBags,
    required this.kgCo2Saved,
    required this.totalEarned,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFFEFFBF1), // soft green background
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.green.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // HEADER
          Row(
            children: const [
              Icon(Icons.trending_up, color: Colors.green),
              SizedBox(width: 6),
              Text(
                "Your Recycling Impact",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // 2×2 GRID
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1,
            children: [
              _impactCard(
                icon: Icons.inventory_2_outlined,
                iconColor: Colors.green,
                value: totalBags,
                label: "Total Bags",
              ),
              _impactCard(
                icon: Icons.eco_outlined,
                iconColor: Colors.green,
                value: kgCo2Saved,
                label: "kg CO₂ Saved",
              ),
              _impactCard(
                icon: Icons.payments_outlined,
                iconColor: Colors.orange,
                value: totalEarned,
                label: "Total Earned",
              ),
              _impactCard(
                icon: Icons.calendar_month,
                iconColor: Colors.blue,
                value: "Nov 2025",
                label: "Member Since",
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Reusable card widget
  Widget _impactCard({
    required IconData icon,
    required String value,
    required String label,
    Color iconColor = Colors.green,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: iconColor, size: 30),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 13)),
        ],
      ),
    );
  }
}
