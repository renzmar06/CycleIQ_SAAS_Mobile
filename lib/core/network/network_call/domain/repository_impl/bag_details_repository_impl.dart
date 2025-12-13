import 'dart:convert';
import 'dart:io';
import 'package:cycleiq_saas_mobile/core/network/network_call/data/data_source/bag_details_remote_data_source.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/domain/repository/bag_details_repository.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/network_info.dart';
import 'package:cycleiq_saas_mobile/core/shared_pref/preferences_utils.dart';
import 'package:cycleiq_saas_mobile/src/add_bag_details/model/bag_details_request.dart';
import 'package:cycleiq_saas_mobile/src/bag_details/model/bag_details.dart';
import 'package:cycleiq_saas_mobile/src/bag_session/model/bag_model.dart';
import 'package:dio/dio.dart';

class BagDetailsRepositoryImpl implements BagDetailsRepository {
  final BagDetailsRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  final PreferencesUtil pref;

  BagDetailsRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
    required this.pref,
  });

  @override
  Future<String> uploadImage(File file) => remoteDataSource.uploadImage(file);

  @override
  Future<String> uploadVideo(File file) => remoteDataSource.uploadVideo(file);

  @override
  Future<Map<String, dynamic>> submitBagDetails(
    BagDetailsRequest request,
  ) async {
    // Build multipart EXACTLY like your cURL:
    final form = FormData();

    form.fields.add(MapEntry("bagQrId", request.bagQrId));

    form.fields.add(
      MapEntry(
        "materials",
        jsonEncode(request.materials.map((m) => m.toJson()).toList()),
      ),
    );

    if (request.notes != null) {
      form.fields.add(MapEntry("notes", request.notes!));
    }

    for (final img in request.images) {
      form.files.add(MapEntry("images", await MultipartFile.fromFile(img)));
    }

    if (request.videoFile != null) {
      form.files.add(
        MapEntry(
          "videos",
          await MultipartFile.fromFile(request.videoFile!.path),
        ),
      );
    }

    return remoteDataSource.submitBagDetails(form);
  }

  @override
  Future<List<BagModel>> getBags(String userId) {
    return remoteDataSource.fetchBags(userId);
  }

  @override
  Future<BagDetailsModel> getBagByQrId(String qrId) {
    return remoteDataSource.fetchBagByQr(qrId);
  }
}
