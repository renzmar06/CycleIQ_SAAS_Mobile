import 'package:flutter/material.dart';
import '../../../../core/services/navigation.dart';

class QuickActionsGrid extends StatelessWidget {
  const QuickActionsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      _QuickActionItem(
        "Bag Drop",
        Icons.shopping_bag_rounded,
        "/drop-off-location",
      ),
      _QuickActionItem(
        "Recycle In-Person",
        Icons.recycling_rounded,
        "/centers",
      ),
      _QuickActionItem(
        "Tickets",
        Icons.confirmation_number_outlined,
        "/tickets",
      ),
      _QuickActionItem("Utility Bill", Icons.receipt_long, "/utility"),
      _QuickActionItem("Rewards", Icons.card_giftcard, "/rewards"),
      _QuickActionItem("Locations", Icons.location_on_outlined, "/centers"),
      _QuickActionItem("Materials", Icons.layers, "/category/Materials"),
      _QuickActionItem(
        "Challenges",
        Icons.emoji_events_outlined,
        "/challenges",
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Quick actions',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(height: 16),

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
            return _ActionTile(item: items[index]);
          },
        ),
      ],
    );
  }
}

class _QuickActionItem {
  final String title;
  final IconData icon;
  final String route;

  _QuickActionItem(this.title, this.icon, this.route);
}

class _ActionTile extends StatelessWidget {
  final _QuickActionItem item;

  const _ActionTile({required this.item});

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
