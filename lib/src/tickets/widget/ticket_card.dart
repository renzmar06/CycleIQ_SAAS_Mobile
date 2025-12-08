import 'package:cycleiq_saas_mobile/src/tickets/model/ticket_model.dart';
import 'package:flutter/material.dart';

class TicketCard extends StatelessWidget {
  final TicketModel ticket;

  const TicketCard({super.key, required this.ticket});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: const Color(0xFF2BC97A),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.attach_money, color: Colors.white),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Bag-Drop Ticket",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text("#${ticket.id}", style: const TextStyle(fontSize: 12)),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "\$${ticket.amount}",
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "+${ticket.points} pts",
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(ticket.date),
              Text("${ticket.bagCount} bags"),
              Text("${ticket.weight} lbs"),
            ],
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            children: ticket.bonuses.map((e) => Chip(label: Text(e))).toList(),
          ),
        ],
      ),
    );
  }
}
