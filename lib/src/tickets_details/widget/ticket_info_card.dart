import 'package:cycleiq_saas_mobile/src/tickets/model/ticket_model.dart';
import 'package:flutter/material.dart';

class TicketInfoCard extends StatelessWidget {
  final TicketModel ticket;

  const TicketInfoCard({super.key, required this.ticket});

  @override
  Widget build(BuildContext context) {
    return _cardWrapper(
      title: "Ticket Information",
      children: [
        _row("Date", ticket.date),
        _row("Type", ticket.type),
        _row("Bags", ticket.bagCount.toString()),
        _row("Total Weight", "${ticket.weight} lbs"),
        _row("Location", ticket.location),
        _row("Operator", ticket.operatorName),
      ],
    );
  }

  Widget _row(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.black54)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
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
