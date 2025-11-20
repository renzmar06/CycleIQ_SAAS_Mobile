import 'package:cycleiq_saas_mobile/src/profile/model/user.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepository {
  Future<Either<Exception, UserModel>> getProfile();
  Future<Either<Exception, UserModel>> updateProfile({
    required String name,
    required String phone,
    String? avatarPath,
  });
  Future<Either<Exception, void>> logout();
}
