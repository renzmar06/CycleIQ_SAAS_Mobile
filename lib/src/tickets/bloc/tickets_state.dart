import 'package:equatable/equatable.dart';
import '../model/ticket_model.dart';

enum TicketsStatus { initial, loading, success, failure }

class TicketsState extends Equatable {
  final TicketsStatus status;
  final List<TicketModel> tickets;
  final String? error;

  const TicketsState({
    this.status = TicketsStatus.initial,
    this.tickets = const [],
    this.error,
  });

  TicketsState copyWith({
    TicketsStatus? status,
    List<TicketModel>? tickets,
    String? error,
  }) {
    return TicketsState(
      status: status ?? this.status,
      tickets: tickets ?? this.tickets,
      error: error,
    );
  }

  @override
  List<Object?> get props => [status, tickets, error];
}
