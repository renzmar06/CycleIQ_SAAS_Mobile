import 'dart:io';
import 'package:cycleiq_saas_mobile/core/network/network_call/api_config.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/data/data_source/bag_details_remote_data_source.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/network_client.dart';
import 'package:cycleiq_saas_mobile/src/bag_details/model/bag_details.dart';
import 'package:cycleiq_saas_mobile/src/bag_session/model/bag_model.dart';
import 'package:dio/dio.dart';

class BagDetailsRemoteDataSourceImpl implements BagDetailsRemoteDataSource {
  final NetworkClient networkClient;

  BagDetailsRemoteDataSourceImpl({required this.networkClient});

  @override
  Future<String> uploadImage(File file) async {
    final name = file.path.split('/').last;
    final form = FormData.fromMap({
      "images": await MultipartFile.fromFile(file.path, filename: name),
    });

    final res = await networkClient.invoke(
      ApiConfig().uploadImage,
      RequestType.post,
      requestBody: form,
    );

    return res.data["url"];
  }

  @override
  Future<String> uploadVideo(File file) async {
    final name = file.path.split('/').last;
    final form = FormData.fromMap({
      "videos": await MultipartFile.fromFile(file.path, filename: name),
    });

    final res = await networkClient.invoke(
      ApiConfig().uploadVideo,
      RequestType.post,
      requestBody: form,
    );

    return res.data["url"];
  }

  @override
  Future<Map<String, dynamic>> submitBagDetails(FormData form) async {
    final res = await networkClient.invoke(
      ApiConfig().submitBagDetails,
      RequestType.post,
      requestBody: form,
    );
    return res.data;
  }

  @override
  Future<List<BagModel>> fetchBags(String userId) async {
    final response = await networkClient.invoke(
      ApiConfig().getBags, // <-- your endpoint
      RequestType.get,
      queryParameters: {"userId": userId},
    );

    final json = response.data;

    if (!(json["success"] ?? false)) {
      throw Exception("Failed to load bags");
    }

    return (json["data"] as List).map((bag) => BagModel.fromJson(bag)).toList();
  }

  @override
  Future<BagDetailsModel> fetchBagByQr(String qrId) async {
    final response = await networkClient.invoke(
      "${ApiConfig.domain}/mobile/bags/by-qr",
      RequestType.get,
      queryParameters: {"bagQrId": qrId},
    );

    return BagDetailsModel.fromJson(response.data["data"]);
  }
}
