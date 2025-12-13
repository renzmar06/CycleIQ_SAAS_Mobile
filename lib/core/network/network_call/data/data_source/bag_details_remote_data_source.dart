import 'dart:io';

import 'package:cycleiq_saas_mobile/src/bag_details/model/bag_details.dart';
import 'package:cycleiq_saas_mobile/src/bag_session/model/bag_model.dart';
import 'package:dio/dio.dart';

abstract class BagDetailsRemoteDataSource {
  Future<String> uploadImage(File file);
  Future<String> uploadVideo(File file);
  Future<Map<String, dynamic>> submitBagDetails(FormData form);
  Future<List<BagModel>> fetchBags(String userId);
  Future<BagDetailsModel> fetchBagByQr(String qrId);
}
