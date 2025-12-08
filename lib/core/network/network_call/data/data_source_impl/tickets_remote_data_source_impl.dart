import 'package:cycleiq_saas_mobile/core/network/network_call/api_config.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/data/data_source/tickets_remote_data_source.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/network_client.dart';
import 'package:cycleiq_saas_mobile/src/tickets/model/ticket_model.dart';

class TicketsRemoteDataSourceImpl implements TicketsRemoteDataSource {
  final NetworkClient networkClient;

  TicketsRemoteDataSourceImpl({required this.networkClient});

  @override
  Future<List<TicketModel>> getTickets() async {
    final response = await networkClient.invoke(
      ApiConfig().getTickets, // your ApiConfig should expose this endpoint
      RequestType.get,
    );
    return response.data;
  }
}
