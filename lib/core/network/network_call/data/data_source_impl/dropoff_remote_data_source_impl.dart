import 'dart:developer';

import 'package:cycleiq_saas_mobile/core/network/network_call/api_config.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/data/data_source/dropoff_remote_data_source.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/network_client.dart';
import 'package:cycleiq_saas_mobile/src/dropoff_location/model/dropoff_location_model.dart';
import 'package:cycleiq_saas_mobile/src/register_bags/model/bag_info_model.dart';

class DropOffRemoteDataSourceImpl implements DropOffRemoteDataSource {
  final NetworkClient networkClient;

  DropOffRemoteDataSourceImpl({required this.networkClient});

  @override
  Future<List<DropOffLocation>> fetchDropOffLocations() async {
    final response = await networkClient.invoke(
      ApiConfig().getRecyclingCenter,
      RequestType.get,
    );

    final data = response.data["data"] as List;

    return data.map((e) => DropOffLocation.fromJson(e)).toList();
  }

  @override
  Future<BagInfoModel> fetchBagInfo(String qrId) async {
    final response = await networkClient.invoke(
      "${ApiConfig.domain}/mobile/bags/by-qr",
      RequestType.get,
      queryParameters: {"bagQrId": qrId},
    );

    if (response.data["success"] == true) {
      log("ndshdbhsb${response.data["data"]}");
      return BagInfoModel.fromJson(response.data["data"]);
    } else {
      throw Exception("Failed to fetch bag details");
    }
  }

  @override
  Future<String> submitOperatorCheckIn(Map<String, dynamic> body) async {
    final response = await networkClient.invoke(
      "${ApiConfig.domain}/mobile/customer-bag-sessions",
      RequestType.post,
      requestBody: body,
    );

    return response.data["data"]["_id"];
  }
}
