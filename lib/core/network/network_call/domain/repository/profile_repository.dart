import 'package:cycleiq_saas_mobile/src/profile/model/user.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class ProfileRepository {
  Future<Either<Exception, ProfileResponse>> fetchProfile();
  Future<Either<Exception, ProfileResponse>> updateProfile(
    Map<String, dynamic> body,
  );
  Future<Either<Exception, String>> uploadImage(FormData formData);
}
