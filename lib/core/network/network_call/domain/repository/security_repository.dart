import 'package:cycleiq_saas_mobile/src/security/model/donation_response.dart';
import 'package:cycleiq_saas_mobile/src/security/model/payout_history_model.dart';
import 'package:cycleiq_saas_mobile/src/security/model/rewards_model.dart';
import 'package:cycleiq_saas_mobile/src/security/model/upload_proof_response.dart';
import 'package:cycleiq_saas_mobile/src/security/model/wallet_model.dart';
import 'package:dartz/dartz.dart';

abstract class SecurityRepository {
  Future<Either<Exception, RewardsModel>> getRewards();
  Future<Either<Exception, WalletModel>> getWalletBalance();
  Future<Either<Exception, List<PayoutHistoryModel>>> getPayoutHistory();
  Future<Either<Exception, DonationResponse>> donate({
    required double amount,
    required int organizationId,
  });
  Future<Either<Exception, UploadProofResponse>> uploadProof({
    required String filePath,
  });
}
