import 'dart:io';
import 'package:cycleiq_saas_mobile/core/network/network_call/api_config.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/data/data_source/security_remote_data_source.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/network_client.dart';
import 'package:dio/dio.dart';

class SecurityRemoteDataSourceImpl implements SecurityRemoteDataSource {
  final NetworkClient networkClient;

  // For testing example, you can use the uploaded file path:
  // /mnt/data/46078204-aacd-47fa-be33-5a56253130f0.png
  static const String sampleLocalProof =
      '/mnt/data/46078204-aacd-47fa-be33-5a56253130f0.png';

  SecurityRemoteDataSourceImpl({required this.networkClient});

  @override
  Future<dynamic> getRewards() async {
    final response = await networkClient.invoke(
      ApiConfig().rewards, // your ApiConfig should expose this endpoint
      RequestType.get,
    );
    return response.data;
  }

  @override
  Future<dynamic> getWalletBalance() async {
    final response = await networkClient.invoke(
      ApiConfig().walletBalance,
      RequestType.get,
    );
    return response.data;
  }

  @override
  Future<dynamic> getPayoutHistory() async {
    final response = await networkClient.invoke(
      ApiConfig().payoutHistory,
      RequestType.get,
    );
    return response.data;
  }

  @override
  Future<dynamic> postDonation({
    required double amount,
    required int organizationId,
  }) async {
    final response = await networkClient.invoke(
      ApiConfig().donation,
      RequestType.post,
      requestBody: {"amount": amount, "organization_id": organizationId},
    );
    return response.data;
  }

  @override
  Future<dynamic> uploadProof({required String filePath}) async {
    // Build form-data
    final file = File(filePath);
    final form = FormData.fromMap({
      "file": await MultipartFile.fromFile(
        file.path,
        filename: file.path.split('/').last,
      ),
    });

    final response = await networkClient.invoke(
      ApiConfig().uploadProof,
      RequestType.post,
      requestBody: form,
      // extraOptions: Options(contentType: "multipart/form-data"),
    );

    return response.data;
  }
}
