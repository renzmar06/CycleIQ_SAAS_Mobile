import 'package:cycleiq_saas_mobile/core/error/exception.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/data/data_source/security_remote_data_source.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/domain/repository/security_repository.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/network_info.dart';
import 'package:cycleiq_saas_mobile/src/security/model/rewards_model.dart';
import 'package:cycleiq_saas_mobile/src/security/model/wallet_model.dart';
import 'package:cycleiq_saas_mobile/src/security/model/payout_history_model.dart';
import 'package:cycleiq_saas_mobile/src/security/model/donation_response.dart';
import 'package:cycleiq_saas_mobile/src/security/model/upload_proof_response.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SecurityRepositoryImpl implements SecurityRepository {
  final NetworkInfo networkInfo;
  final SecurityRemoteDataSource remote;

  SecurityRepositoryImpl({required this.networkInfo, required this.remote});

  @override
  Future<Either<Exception, RewardsModel>> getRewards() async {
    if (await networkInfo.checkIsConnected()) {
      try {
        final response = await remote.getRewards();

        if (response['error'] == true) {
          return Left(
            GeneralException(message: response['message'], code: "1001"),
          );
        }

        final data = response['data'] ?? {};
        final model = RewardsModel.fromJson(data as Map<String, dynamic>);
        return Right(model);
      } on ServerException catch (ex) {
        return Left(
          ServerException(
            dioException: DioException(
              requestOptions: RequestOptions(),
              error: ex.dioException,
            ),
          ),
        );
      }
    } else {
      return Left(NoInternetException(message: "No Internet Connection"));
    }
  }

  @override
  Future<Either<Exception, WalletModel>> getWalletBalance() async {
    if (await networkInfo.checkIsConnected()) {
      try {
        final response = await remote.getWalletBalance();

        if (response['error'] == true) {
          return Left(
            GeneralException(message: response['message'], code: "1001"),
          );
        }

        final data = response['data'] ?? {};
        final model = WalletModel.fromJson(data as Map<String, dynamic>);
        return Right(model);
      } on ServerException catch (ex) {
        return Left(
          ServerException(
            dioException: DioException(
              requestOptions: RequestOptions(),
              error: ex.dioException,
            ),
          ),
        );
      }
    } else {
      return Left(NoInternetException(message: "No Internet Connection"));
    }
  }

  @override
  Future<Either<Exception, List<PayoutHistoryModel>>> getPayoutHistory() async {
    if (await networkInfo.checkIsConnected()) {
      try {
        final response = await remote.getPayoutHistory();

        if (response['error'] == true) {
          return Left(
            GeneralException(message: response['message'], code: "1001"),
          );
        }

        final List raw = response['data'] ?? [];
        final List<PayoutHistoryModel> list = raw
            .map((e) => PayoutHistoryModel.fromJson(e as Map<String, dynamic>))
            .toList();

        return Right(list);
      } on ServerException catch (ex) {
        return Left(
          ServerException(
            dioException: DioException(
              requestOptions: RequestOptions(),
              error: ex.dioException,
            ),
          ),
        );
      }
    } else {
      return Left(NoInternetException(message: "No Internet Connection"));
    }
  }

  @override
  Future<Either<Exception, DonationResponse>> donate({
    required double amount,
    required int organizationId,
  }) async {
    if (await networkInfo.checkIsConnected()) {
      try {
        final response = await remote.postDonation(
          amount: amount,
          organizationId: organizationId,
        );

        if (response['error'] == true) {
          return Left(
            GeneralException(message: response['message'], code: "1001"),
          );
        }

        final data = response['data'] ?? {};
        final model = DonationResponse.fromJson(data as Map<String, dynamic>);
        return Right(model);
      } on ServerException catch (ex) {
        return Left(
          ServerException(
            dioException: DioException(
              requestOptions: RequestOptions(),
              error: ex.dioException,
            ),
          ),
        );
      }
    } else {
      return Left(NoInternetException(message: "No Internet Connection"));
    }
  }

  @override
  Future<Either<Exception, UploadProofResponse>> uploadProof({
    required String filePath,
  }) async {
    if (await networkInfo.checkIsConnected()) {
      try {
        final response = await remote.uploadProof(filePath: filePath);

        if (response['error'] == true) {
          return Left(
            GeneralException(message: response['message'], code: "1001"),
          );
        }

        final data = response['data'] ?? {};
        final model = UploadProofResponse.fromJson(
          data as Map<String, dynamic>,
        );
        return Right(model);
      } on ServerException catch (ex) {
        return Left(
          ServerException(
            dioException: DioException(
              requestOptions: RequestOptions(),
              error: ex.dioException,
            ),
          ),
        );
      }
    } else {
      return Left(NoInternetException(message: "No Internet Connection"));
    }
  }
}
