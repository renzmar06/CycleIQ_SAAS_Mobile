import 'dart:developer';

import 'package:cycleiq_saas_mobile/core/error/exception.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/data/data_source/profile_remote_data_source.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/network_info.dart';
import 'package:cycleiq_saas_mobile/core/shared_pref/preferences_utils.dart';
import 'package:cycleiq_saas_mobile/src/profile/model/user.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../domain/repository/profile_repository.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  final NetworkInfo networkInfo;
  final ProfileRemoteDataSource remoteDataSource;
  final PreferencesUtil pref;

  ProfileRepositoryImpl({
    required this.networkInfo,
    required this.remoteDataSource,
    required this.pref,
  });

  @override
  Future<Either<Exception, ProfileResponse>> fetchProfile() async {
    if (await networkInfo.checkIsConnected()) {
      try {
        final response = await remoteDataSource.fetchProfile();
        log("jbjfhsbhfbshb$response");

        if (response["success"] == false) {
          return Left(
            GeneralException(
              message: response["message"] ?? "Failed",
              code: "1001",
            ),
          );
        }

        return Right(ProfileResponse.fromJson(response));
      } on ServerException catch (exception) {
        return Left(
          ServerException(
            dioException: DioException(
              error: exception.dioException,
              requestOptions: RequestOptions(),
            ),
          ),
        );
      }
    } else {
      return Left(NoInternetException(message: "No Internet Connection"));
    }
  }

  @override
  Future<Either<Exception, ProfileResponse>> updateProfile(body) async {
    if (await networkInfo.checkIsConnected()) {
      try {
        final response = await remoteDataSource.updateProfile(body);

        if (response["success"] == false) {
          return Left(
            GeneralException(
              message: response["message"] ?? "Failed",
              code: "1001",
            ),
          );
        }

        return Right(ProfileResponse.fromJson(response));
      } on ServerException catch (exception) {
        return Left(
          ServerException(
            dioException: DioException(
              error: exception.dioException,
              requestOptions: RequestOptions(),
            ),
          ),
        );
      }
    } else {
      return Left(NoInternetException(message: "No Internet connection"));
    }
  }

  @override
  Future<Either<Exception, String>> uploadImage(FormData formData) async {
    if (await networkInfo.checkIsConnected()) {
      try {
        final res = await remoteDataSource.uploadImage(formData);

        if (res['success'] == false) {
          return Left(GeneralException(message: res['message'], code: '1001'));
        }

        return Right(res['fileUrl'] ?? "");
      } on ServerException catch (exception) {
        return Left(
          ServerException(
            dioException: DioException(
              error: exception.dioException,
              requestOptions: RequestOptions(),
            ),
          ),
        );
      }
    } else {
      return Left(NoInternetException(message: 'No Internet Connection'));
    }
  }
}
