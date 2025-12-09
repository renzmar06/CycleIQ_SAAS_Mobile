import 'package:cycleiq_saas_mobile/src/tickets/model/ticket_model.dart';
import 'package:flutter/material.dart';

class RewardsCard extends StatelessWidget {
  final TicketModel ticket;

  const RewardsCard({super.key, required this.ticket});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _rewardTile(
          "Points",
          ticket.points.toString(),
          Icons.flash_on,
          const Color(0xFFFFF3E0),
        ),
        const SizedBox(width: 12),
        _rewardTile(
          "CO₂ Saved",
          "${ticket.co2Saved} lb",
          Icons.eco,
          const Color(0xFFE8F5E9),
        ),
      ],
    );
  }

  Widget _rewardTile(String title, String value, IconData icon, Color bg) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Icon(icon, size: 30),
            const SizedBox(height: 8),
            Text(title),
            const SizedBox(height: 6),
            Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
