import 'package:cycleiq_saas_mobile/src/tickets/model/ticket_model.dart';

abstract class TicketsRepository {
  Future<List<TicketModel>> fetchTickets();
}
