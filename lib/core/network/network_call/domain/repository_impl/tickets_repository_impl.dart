import 'package:cycleiq_saas_mobile/core/network/network_call/data/data_source/tickets_remote_data_source.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/domain/repository/tickets_repository.dart';
import 'package:cycleiq_saas_mobile/src/tickets/model/ticket_model.dart';

class TicketsRepositoryImpl implements TicketsRepository {
  final TicketsRemoteDataSource remoteDataSource;

  TicketsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<TicketModel>> fetchTickets() {
    return remoteDataSource.getTickets();
  }
}
