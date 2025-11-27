import 'package:cycleiq_saas_mobile/core/error/exception.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/data/data_source/auth_remote_data_source.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/data/model/login_response.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/data/model/register_response.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/domain/repository/auth_repository.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/network_info.dart';
import 'package:cycleiq_saas_mobile/core/shared_pref/preferences_utils.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AuthRepositoryImpl extends AuthRepository {
  final NetworkInfo networkInfo;
  final AuthRemoteDataSource remoteDataSource;
  final PreferencesUtil pref;

  AuthRepositoryImpl({
    required this.networkInfo,
    required this.remoteDataSource,
    required this.pref,
  });

  @override
  Future<Either<Exception, LoginResponse>> login(String body) async {
    if (await networkInfo.checkIsConnected()) {
      try {
        final response = await remoteDataSource.login(body);
        if (response['success'] == false) {
          return Left(
            GeneralException(message: response['message'], code: '1001'),
          );
        }
        LoginResponse responseModel = LoginResponse.fromJson(response);
        return Right(responseModel);
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

  @override
  Future<Either<Exception, RegisterResponse>> register(String body) async {
    if (await networkInfo.checkIsConnected()) {
      try {
        final response = await remoteDataSource.register(body);
        if (response['success'] == false) {
          return Left(
            GeneralException(message: response['message'], code: '1001'),
          );
        }
        RegisterResponse responseModel = RegisterResponse.fromJson(response);
        return Right(responseModel);
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
