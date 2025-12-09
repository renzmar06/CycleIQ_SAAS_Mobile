import 'package:cycleiq_saas_mobile/src/tickets/model/ticket_model.dart';
import 'package:cycleiq_saas_mobile/src/tickets/widget/ticket_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/tickets_bloc.dart';
import '../bloc/tickets_event.dart';
import '../bloc/tickets_state.dart';

class MyTicketsScreen extends StatelessWidget {
  const MyTicketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _MyTicketsView();
  }
}

class _MyTicketsView extends StatelessWidget {
  const _MyTicketsView();
  static List<TicketModel> tickets = [
    TicketModel(
      id: "69328875",
      date: "Dec 5, 2025 7:23 AM",
      type: "Bag-Drop",
      bagCount: 1,
      weight: 15.6,
      payout: 12.75,
      points: 250,
      co2Saved: 8.5,
      location: "Downtown Recycling Center",
      operatorName: "Auto-processed",
      materials: [
        TicketMaterial(name: "Aluminum", weight: 8.2),
        TicketMaterial(name: "Plastic PET", weight: 5.4),
        TicketMaterial(name: "Glass", weight: 2.0),
      ],
      bonuses: [
        TicketBonus(title: "Sponsor Bonus +\$0.25/lb", amount: 0.25),
        TicketBonus(title: "Downtown Location +\$2", amount: 2.00),
      ],
    ),

    TicketModel(
      id: "69328443",
      date: "Dec 5, 2025 6:40 AM",
      type: "Bag-Drop",
      bagCount: 1,
      weight: 15.6,
      payout: 12.75,
      points: 250,
      co2Saved: 8.5,
      location: "Uptown Recycling Hub",
      operatorName: "Auto-processed",
      materials: [
        TicketMaterial(name: "Aluminum", weight: 7.0),
        TicketMaterial(name: "Plastic PET", weight: 6.4),
        TicketMaterial(name: "Glass", weight: 2.2),
      ],
      bonuses: [TicketBonus(title: "Sponsor Bonus +\$0.25/lb", amount: 0.25)],
    ),

    TicketModel(
      id: "693283f8",
      date: "Dec 5, 2025 5:58 AM",
      type: "Bag-Drop",
      bagCount: 1,
      weight: 15.6,
      payout: 12.75,
      points: 250,
      co2Saved: 8.5,
      location: "West Side Recycling",
      operatorName: "Auto-processed",
      materials: [
        TicketMaterial(name: "Aluminum", weight: 6.5),
        TicketMaterial(name: "Plastic PET", weight: 7.1),
        TicketMaterial(name: "Glass", weight: 2.0),
      ],
      bonuses: [TicketBonus(title: "Downtown Location +\$2", amount: 2.00)],
    ),

    TicketModel(
      id: "6932830c",
      date: "Dec 5, 2025 5:15 AM",
      type: "Bag-Drop",
      bagCount: 1,
      weight: 15.6,
      payout: 12.75,
      points: 250,
      co2Saved: 8.5,
      location: "East Eco Center",
      operatorName: "Auto-processed",
      materials: [
        TicketMaterial(name: "Aluminum", weight: 8.0),
        TicketMaterial(name: "Plastic PET", weight: 5.1),
        TicketMaterial(name: "Glass", weight: 2.5),
      ],
      bonuses: [],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: BlocBuilder<TicketsBloc, TicketsState>(
                builder: (context, state) {
                  // if (state.status == TicketsStatus.loading) {
                  //   return const Center(child: CircularProgressIndicator());
                  // }

                  // if (state.status == TicketsStatus.failure) {
                  //   return Center(child: Text(state.error ?? "Error"));
                  // }

                  // if (state.tickets.isEmpty) {
                  //   return const Center(child: Text("No tickets found"));
                  // }

                  return RefreshIndicator(
                    onRefresh: () async {
                      context.read<TicketsBloc>().add(RefreshTicketsEvent());
                    },
                    child: ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: tickets.length,
                      // itemCount: state.tickets.length,
                      itemBuilder: (context, index) {
                        return TicketCard(ticket: tickets[index]);
                        // return TicketCard(ticket: state.tickets[index]);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 28),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF4F9FF8), Color(0xFF2E5F94)],
        ),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(28)),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.receipt_long, color: Colors.white),
              SizedBox(width: 10),
              Text(
                "My Tickets",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ],
          ),
          SizedBox(height: 6),
          Text(
            "Track your recycling history",
            style: TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }
}
