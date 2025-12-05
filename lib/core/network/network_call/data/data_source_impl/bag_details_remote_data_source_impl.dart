import 'dart:io';
import 'package:cycleiq_saas_mobile/core/network/network_call/api_config.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/data/data_source/bag_details_remote_data_source.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/network_client.dart';
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
  Future submitBagDetails(FormData form) async {
    final res = await networkClient.invoke(
      ApiConfig().submitBagDetails,
      RequestType.post,
      requestBody: form,
    );
    return res.data;
  }
}
