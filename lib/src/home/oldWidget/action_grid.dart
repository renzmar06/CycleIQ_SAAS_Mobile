import 'package:flutter/material.dart';

class ActionsGrid extends StatelessWidget {
  const ActionsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final actions = [
      ("Bag Drop", Icons.inventory_2_rounded),
      ("Recycle In-Person", Icons.store_rounded),
      ("Tickets", Icons.receipt_long),
      ("Utility Bill", Icons.description_rounded),
      ("Rewards", Icons.card_giftcard),
      ("Locations", Icons.location_on),
      ("Materials", Icons.menu_book_rounded),
      ("Challenges", Icons.emoji_events_rounded),
    ];

    final colors = [
      Colors.green,
      Colors.blue,
      Colors.purple,
      Colors.orange,
      Colors.greenAccent,
      Colors.green,
      Colors.green,
      Colors.green,
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: actions.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 3.2,
      ),
      itemBuilder: (context, i) {
        final (title, icon) = actions[i];
        final color = colors[i];

        return Container(
          padding: const EdgeInsets.all(17),
          decoration: BoxDecoration(
            color: color.withOpacity(.15),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Icon(icon, color: color, size: 32),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    color: color,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
