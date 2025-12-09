import 'package:cycleiq_saas_mobile/core/network/network_call/data/data_source/ticket_data_source.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/domain/repository/ticket_repository.dart';
import 'package:cycleiq_saas_mobile/src/tickets/model/ticket_model.dart';

class TicketRepositoryImpl implements TicketRepository {
  final TicketDataSource remoteDataSource;

  TicketRepositoryImpl({required this.remoteDataSource});

  @override
  Future<TicketModel> getTicketDetails() {
    return remoteDataSource.fetchTicketDetails();
  }
}
