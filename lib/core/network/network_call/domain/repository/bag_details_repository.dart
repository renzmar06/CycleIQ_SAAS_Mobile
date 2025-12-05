import 'dart:io';

import 'package:cycleiq_saas_mobile/src/bag_details/model/bag_details_request.dart';

abstract class BagDetailsRepository {
  Future<String> uploadImage(File file);
  Future<String> uploadVideo(File file);
  Future submitBagDetails(BagDetailsRequest request);
}
