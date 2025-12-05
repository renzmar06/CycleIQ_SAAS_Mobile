import 'package:cycleiq_saas_mobile/core/network/network_call/data/data_source/dropoff_remote_data_source.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/network_client.dart';
import 'package:cycleiq_saas_mobile/src/dropoff_location/model/dropoff_location_model.dart';

class DropOffRemoteDataSourceImpl implements DropOffRemoteDataSource {
  final NetworkClient networkClient;

  DropOffRemoteDataSourceImpl({required this.networkClient});

  @override
  Future<List<DropOffLocation>> fetchDropOffLocations() async {
    final response = await networkClient.invoke(
      "http://ec2-3-142-235-10.us-east-2.compute.amazonaws.com/api/addbranch",
      RequestType.get,
    );

    final data = response.data["data"] as List;

    return data.map((e) => DropOffLocation.fromJson(e)).toList();
  }
}
