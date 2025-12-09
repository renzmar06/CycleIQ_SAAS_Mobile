import 'package:cycleiq_saas_mobile/src/tickets/model/ticket_model.dart';
import 'package:cycleiq_saas_mobile/src/tickets_details/widget/material_breakdown.dart';
import 'package:cycleiq_saas_mobile/src/tickets_details/widget/rewards_card.dart';
import 'package:cycleiq_saas_mobile/src/tickets_details/widget/sponsor_bonus_card.dart';
import 'package:cycleiq_saas_mobile/src/tickets_details/widget/tecket_header.dart';
import 'package:cycleiq_saas_mobile/src/tickets_details/widget/ticket_actions.dart';
import 'package:cycleiq_saas_mobile/src/tickets_details/widget/ticket_info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/ticket_bloc.dart';
import '../bloc/ticket_event.dart';
import '../bloc/ticket_state.dart';

class TicketDetailsScreen extends StatelessWidget {
  final TicketModel ticket;
  const TicketDetailsScreen({required this.ticket, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => context.read<TicketBloc>()..add(LoadTicketDetails()),
      child: Scaffold(
        backgroundColor: const Color(0xFFF4F7FA),
        body: SafeArea(
          child: BlocBuilder<TicketBloc, TicketState>(
            builder: (context, state) {
              if (state is TicketLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is TicketLoaded) {
                return Column(
                  children: [
                    TicketHeader(ticket: state.ticket),

                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            TicketInfoCard(ticket: state.ticket),
                            const SizedBox(height: 16),
                            MaterialBreakdown(ticket: state.ticket),
                            const SizedBox(height: 16),
                            SponsorBonusCard(ticket: state.ticket),
                            const SizedBox(height: 16),
                            RewardsCard(ticket: state.ticket),
                            const SizedBox(height: 20),
                            TicketActions(ticket: state.ticket),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }

              return const Center(child: Text("Error loading ticket"));
            },
          ),
        ),
      ),
    );
  }
}
