import 'dart:io';

import 'package:cycleiq_saas_mobile/src/add_bag_details/model/bag_details_request.dart';
import 'package:cycleiq_saas_mobile/src/bag_details/model/bag_details.dart';
import 'package:cycleiq_saas_mobile/src/bag_session/model/bag_model.dart';

abstract class BagDetailsRepository {
  Future<String> uploadImage(File file);
  Future<String> uploadVideo(File file);
  Future<Map<String, dynamic>> submitBagDetails(BagDetailsRequest request);
  Future<List<BagModel>> getBags(String userId);
  Future<BagDetailsModel> getBagByQrId(String qrId);
}
