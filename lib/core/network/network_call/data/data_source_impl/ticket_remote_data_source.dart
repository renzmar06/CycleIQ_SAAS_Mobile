import 'package:cycleiq_saas_mobile/core/network/network_call/data/data_source/ticket_data_source.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/network_client.dart';
import 'package:cycleiq_saas_mobile/src/tickets/model/ticket_model.dart';

class TicketRemoteDataSourceImpl implements TicketDataSource {
  final NetworkClient networkClient;
  TicketRemoteDataSourceImpl({required this.networkClient});
  @override
  Future<TicketModel> fetchTicketDetails() async {
    await Future.delayed(const Duration(seconds: 1)); // Simulated API delay

    return TicketModel(
      id: "69328875",
      date: "Dec 5, 2025 7:23 AM",
      type: "Bag-Drop",
      bagCount: 1,
      weight: 15.6,
      payout: 12.75,
      points: 250,
      co2Saved: 8.5,
      location: "Downtown Recycling Center",
      operatorName: "Auto-processed",
      materials: [
        TicketMaterial(name: "Aluminum", weight: 8.2),
        TicketMaterial(name: "Plastic PET", weight: 5.4),
        TicketMaterial(name: "Glass", weight: 2.0),
      ],
      bonuses: [
        TicketBonus(title: "Sponsor Bonus +\$0.25/lb", amount: 0.25),
        TicketBonus(title: "Downtown Location +\$2", amount: 2.00),
      ],
    );
  }
}
