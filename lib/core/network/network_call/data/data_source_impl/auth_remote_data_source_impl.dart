import 'package:cycleiq_saas_mobile/core/network/network_call/api_config.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/data/data_source/auth_remote_data_source.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/network_client.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final NetworkClient networkClient;

  AuthRemoteDataSourceImpl({required this.networkClient});

  @override
  Future<dynamic> login(String body) async {
    final response = await networkClient.invoke(
      ApiConfig().login,
      RequestType.post,
      requestBody: body,
    );
    return response.data;
  }

  @override
  Future<dynamic> register(String body) async {
    final response = await networkClient.invoke(
      ApiConfig().register,
      RequestType.post,
      requestBody: body,
    );
    return response.data;
  }
}
