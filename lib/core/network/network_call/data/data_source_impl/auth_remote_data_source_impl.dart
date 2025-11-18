import 'dart:convert';

import 'package:cycleiq_saas_mobile/core/network/network_call/api_config.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/data/data_source/auth_remote_data_source.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/data/model/login_response.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/network_client.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final NetworkClient networkClient;

  AuthRemoteDataSourceImpl({required this.networkClient});

  @override
  Future<LoginResponse> login(String email, String password) async {
    final response = await networkClient.invoke(
      ApiConfig().getPopularProduct,
      RequestType.post,
      requestBody: jsonEncode({"id": 'all', "customer_id": ''}),
    );
    return response.data;
  }

  @override
  Future<LoginResponse> register(String email, String password) async {
    final response = await networkClient.invoke(
      ApiConfig().getPopularProduct,
      RequestType.post,
      requestBody: jsonEncode({"id": 'all', "customer_id": ''}),
    );
    return response.data;
  }
}
