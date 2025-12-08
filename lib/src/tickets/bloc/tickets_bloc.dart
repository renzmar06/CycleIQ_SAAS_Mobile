import 'package:cycleiq_saas_mobile/core/network/network_call/domain/repository/tickets_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'tickets_event.dart';
import 'tickets_state.dart';

class TicketsBloc extends Bloc<TicketsEvent, TicketsState> {
  final TicketsRepository repository;

  TicketsBloc({required this.repository}) : super(const TicketsState()) {
    on<LoadTicketsEvent>(_loadTickets);
    on<RefreshTicketsEvent>(_refreshTickets);
  }

  Future<void> _loadTickets(
    LoadTicketsEvent event,
    Emitter<TicketsState> emit,
  ) async {
    emit(state.copyWith(status: TicketsStatus.loading));

    try {
      final tickets = await repository.fetchTickets();
      emit(state.copyWith(status: TicketsStatus.success, tickets: tickets));
    } catch (e) {
      emit(state.copyWith(status: TicketsStatus.failure, error: e.toString()));
    }
  }

  Future<void> _refreshTickets(
    RefreshTicketsEvent event,
    Emitter<TicketsState> emit,
  ) async {
    try {
      final tickets = await repository.fetchTickets();
      emit(state.copyWith(status: TicketsStatus.success, tickets: tickets));
    } catch (e) {}
  }
}
