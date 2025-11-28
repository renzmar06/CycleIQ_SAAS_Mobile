import 'package:cycleiq_saas_mobile/core/services/navigation.dart';
import 'package:flutter/material.dart';

class RewardActionsGrid extends StatelessWidget {
  const RewardActionsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      _GridItem(
        "Impact Certificates",
        Icons.workspace_premium_outlined,
        "/impact-certificate",
      ),
      _GridItem("Badges", Icons.military_tech_outlined, "/utility"),
      _GridItem("Points History", Icons.history, "/utility"),
      _GridItem("Store", Icons.storefront_outlined, "/utility"),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Quick actions',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),

        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 per row
            crossAxisSpacing: 14,
            mainAxisSpacing: 14,
            childAspectRatio: 1.05, // square-ish cards
          ),
          itemBuilder: (_, index) {
            return _RewardTile(item: items[index]);
          },
        ),
      ],
    );
  }
}

class _GridItem {
  final String title;
  final IconData icon;
  // final Color color;
  final String route;

  _GridItem(this.title, this.icon, this.route);
}

class _RewardTile extends StatelessWidget {
  final _GridItem item;

  const _RewardTile({required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => AppNav.push(context, item.route),
      child: Container(
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
            Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.12),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(item.icon, color: Colors.green, size: 28),
            ),
            const SizedBox(height: 10),
            Text(
              item.title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}
