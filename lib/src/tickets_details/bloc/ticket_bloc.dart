import 'dart:developer';

import 'package:cycleiq_saas_mobile/core/network/network_call/domain/repository/ticket_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'ticket_event.dart';
import 'ticket_state.dart';

class TicketBloc extends Bloc<TicketEvent, TicketState> {
  final TicketRepository repository;

  TicketBloc({required this.repository}) : super(TicketInitial()) {
    on<LoadTicketDetails>(_loadTicket);
  }

  Future<void> _loadTicket(
    LoadTicketDetails event,
    Emitter<TicketState> emit,
  ) async {
    emit(TicketLoading());

    try {
      final ticket = await repository.getTicketDetails();
      log("fdnsjfnnf${ticket.bagCount}");
      emit(TicketLoaded(ticket));
    } catch (e) {
      emit(TicketError("Failed to load ticket"));
    }
  }
}
