import 'package:cycleiq_saas_mobile/core/error/exception.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/domain/repository/notification_repository.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/network_info.dart';
import 'package:cycleiq_saas_mobile/core/shared_pref/preferences_utils.dart';
import 'package:cycleiq_saas_mobile/src/notification/model/notification_model.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/data/data_source/notification_remote_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final NetworkInfo networkInfo;
  final NotificationRemoteDataSource remoteDataSource;
  final PreferencesUtil pref;

  NotificationRepositoryImpl({
    required this.networkInfo,
    required this.remoteDataSource,
    required this.pref,
  });

  @override
  Future<Either<Exception, List<NotificationModel>>> getNotifications() async {
    if (await networkInfo.checkIsConnected()) {
      try {
        final response = await remoteDataSource.getNotifications();

        if (response['error'] == true) {
          return Left(
            GeneralException(message: response['message'], code: "1001"),
          );
        }

        final List list = response['data'] ?? [];

        return Right(list.map((e) => NotificationModel.fromJson(e)).toList());
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
  Future<Either<Exception, bool>> deleteNotification(int id) async {
    if (await networkInfo.checkIsConnected()) {
      try {
        final response = await remoteDataSource.deleteNotification(id);

        if (response['error'] == true) {
          return Left(
            GeneralException(message: response['message'], code: "1001"),
          );
        }

        return const Right(true);
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
  Future<Either<Exception, bool>> markAllAsRead() async {
    if (await networkInfo.checkIsConnected()) {
      try {
        final response = await remoteDataSource.markAllAsRead();

        if (response['error'] == true) {
          return Left(
            GeneralException(message: response['message'], code: "1001"),
          );
        }

        return const Right(true);
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
}
