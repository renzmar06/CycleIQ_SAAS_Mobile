import 'package:cycleiq_saas_mobile/core/error/exception.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/api_config.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/data/data_source/profile_remote_data_source.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/network_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final NetworkClient networkClient;

  ProfileRemoteDataSourceImpl({required this.networkClient});

  @override
  Future<dynamic> fetchProfile() async {
    final response = await networkClient.invoke(
      ApiConfig().getProfile,
      RequestType.get,
    );
    return response.data;
  }

  @override
  Future<dynamic> updateProfile(body) async {
    final response = await networkClient.invoke(
      ApiConfig().updateProfile,
      RequestType.put,
      requestBody: body,
    );
    if (response.statusCode == 200) {
      return response.data;
    } else {
      debugPrint('Exception cashIn throw ServerException');
      throw ServerException(
        dioException: DioException(
          requestOptions: response.data,
          error: response,
          type: DioExceptionType.badResponse,
        ),
      );
    }
  }

  @override
  Future<dynamic> uploadImage(FormData formData) async {
    final response = await networkClient.invoke(
      ApiConfig().uploadImage,
      RequestType.post,
      requestBody: formData,
    );
    return response.data;
  }
}
