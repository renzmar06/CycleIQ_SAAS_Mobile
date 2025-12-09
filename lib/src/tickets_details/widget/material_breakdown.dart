import 'package:cycleiq_saas_mobile/src/tickets/model/ticket_model.dart';
import 'package:flutter/material.dart';

class MaterialBreakdown extends StatelessWidget {
  final TicketModel ticket;

  const MaterialBreakdown({super.key, required this.ticket});

  @override
  Widget build(BuildContext context) {
    return _cardWrapper(
      title: "Materials Breakdown",
      children: ticket.materials
          .map(
            (e) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(e.name),
                  Text(
                    "${e.weight} lbs",
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _cardWrapper({required String title, required List<Widget> children}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _decoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: _titleStyle),
          const SizedBox(height: 12),
          ...children,
        ],
      ),
    );
  }

  BoxDecoration get _decoration => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(16),
    boxShadow: [
      BoxShadow(color: Colors.black12.withOpacity(.05), blurRadius: 10),
    ],
  );

  TextStyle get _titleStyle =>
      const TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
}
