import 'package:cycleiq_saas_mobile/src/tickets/model/ticket_model.dart';

abstract class TicketsRemoteDataSource {
  Future<List<TicketModel>> getTickets();
}
