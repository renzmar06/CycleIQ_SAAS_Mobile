import 'dart:io';

import 'package:dio/dio.dart';

abstract class BagDetailsRemoteDataSource {
  Future<String> uploadImage(File file);
  Future<String> uploadVideo(File file);
  Future submitBagDetails(FormData form);
}
