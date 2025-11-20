import 'package:cycleiq_saas_mobile/core/network/network_call/data/data_source/profile_remote_data_source.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/domain/repository/profile_repository.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/network_info.dart';
import 'package:cycleiq_saas_mobile/core/shared_pref/preferences_utils.dart';
import 'package:cycleiq_saas_mobile/src/profile/model/user.dart';
import 'package:dartz/dartz.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final NetworkInfo networkInfo;
  final ProfileRemoteDataSource remoteDataSource;
  final PreferencesUtil pref;

  ProfileRepositoryImpl({
    required this.networkInfo,
    required this.remoteDataSource,
    required this.pref,
  });

  @override
  Future<Either<Exception, UserModel>> getProfile() async {
    try {
      final model = await remoteDataSource.getProfile();
      return Right(model);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, UserModel>> updateProfile({
    required String name,
    required String phone,
    String? avatarPath,
  }) async {
    try {
      final model = await remoteDataSource.updateProfile(
        name,
        phone,
        avatarPath,
      );
      return Right(model);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, void>> logout() async {
    try {
      await remoteDataSource.logout();
      return const Right(null);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
