import 'dart:io';
import 'package:cycleiq_saas_mobile/core/error/exception.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/api_config.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/data/data_source/profile_remote_data_source.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/network_client.dart';
import 'package:cycleiq_saas_mobile/src/profile/model/user.dart';
import 'package:dio/dio.dart';

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final NetworkClient networkClient;

  ProfileRemoteDataSourceImpl({required this.networkClient});

  @override
  Future<UserModel> getProfile() async {
    final response = await networkClient.invoke(
      ApiConfig().getProfile,
      RequestType.get,
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(response.data);
    } else {
      throw ServerException(
        dioException: DioException(
          requestOptions: response.requestOptions,
          error: response.data,
          type: DioExceptionType.badResponse,
        ),
      );
    }
  }

  @override
  Future<dynamic> updateProfile(
    String name,
    String phone,
    String? avatarPath,
  ) async {
    try {
      final formData = FormData.fromMap({"name": name, "phone": phone});

      if (avatarPath != null && File(avatarPath).existsSync()) {
        formData.files.add(
          MapEntry(
            "avatar",
            await MultipartFile.fromFile(avatarPath, filename: "avatar.jpg"),
          ),
        );
      }

      final response = await networkClient.invoke(
        ApiConfig().updateProfile,
        RequestType.post,
        requestBody: formData,
      );

      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data);
      } else {
        throw ServerException(
          dioException: DioException(
            requestOptions: response.requestOptions,
            error: response.data,
            type: DioExceptionType.badResponse,
          ),
        );
      }
    } catch (e) {
      throw Exception("Profile update failed → $e");
    }
  }

  @override
  Future<void> logout() async {
    final response = await networkClient.invoke(
      ApiConfig().logout,
      RequestType.post,
    );

    if (response.statusCode != 200) {
      throw ServerException(
        dioException: DioException(
          requestOptions: response.requestOptions,
          error: response.data,
          type: DioExceptionType.badResponse,
        ),
      );
    }
  }
}
