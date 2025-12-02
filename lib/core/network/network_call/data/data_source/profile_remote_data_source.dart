import 'package:dio/dio.dart';

abstract class ProfileRemoteDataSource {
  Future<dynamic> fetchProfile();
  Future<dynamic> updateProfile(Map<String, dynamic> body);
  Future<dynamic> uploadImage(FormData formData);
}
