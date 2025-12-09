import 'package:cycleiq_saas_mobile/src/tickets/model/ticket_model.dart';

abstract class TicketState {}

class TicketInitial extends TicketState {}

class TicketLoading extends TicketState {}

class TicketLoaded extends TicketState {
  final TicketModel ticket;

  TicketLoaded(this.ticket);
}

class TicketError extends TicketState {
  final String message;

  TicketError(this.message);
}
