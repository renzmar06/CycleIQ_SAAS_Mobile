import 'package:flutter/material.dart';
import '../../../../core/services/navigation.dart';

class QuickActionsSection extends StatelessWidget {
  const QuickActionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _quickAction(
          icon: Icons.delete_outline_rounded,
          title: "Request Pickup",
          route: "/pickup-request",
          color: Colors.green,
          context: context,
        ),
        _quickAction(
          icon: Icons.location_on_outlined,
          title: "Track Pickup",
          route: "/pickup-track",
          color: Colors.black87,
          context: context,
        ),
        _quickAction(
          icon: Icons.recycling_rounded,
          title: "Centers",
          route: "/centers",
          color: Colors.grey.shade800,
          context: context,
        ),
      ],
    );
  }

  Widget _quickAction({
    required IconData icon,
    required String title,
    required String route,
    required Color color,
    required BuildContext context,
  }) {
    return GestureDetector(
      onTap: () => AppNav.to(context, route),
      child: Column(
        children: [
          Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              color: color.withOpacity(.12),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(height: 6),
          Text(title, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
