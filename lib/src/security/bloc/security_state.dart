import 'package:equatable/equatable.dart';
import 'package:cycleiq_saas_mobile/src/security/model/rewards_model.dart';
import 'package:cycleiq_saas_mobile/src/security/model/wallet_model.dart';
import 'package:cycleiq_saas_mobile/src/security/model/payout_history_model.dart';

enum SecurityStatus { initial, loading, success, failure, uploading, donating }

class SecurityState extends Equatable {
  final SecurityStatus status;
  final RewardsModel? rewards;
  final WalletModel? wallet;
  final List<PayoutHistoryModel> payoutHistory;
  final String? error;

  const SecurityState({
    this.status = SecurityStatus.initial,
    this.rewards,
    this.wallet,
    this.payoutHistory = const [],
    this.error,
  });

  SecurityState copyWith({
    SecurityStatus? status,
    RewardsModel? rewards,
    WalletModel? wallet,
    List<PayoutHistoryModel>? payoutHistory,
    String? error,
  }) {
    return SecurityState(
      status: status ?? this.status,
      rewards: rewards ?? this.rewards,
      wallet: wallet ?? this.wallet,
      payoutHistory: payoutHistory ?? this.payoutHistory,
      error: error,
    );
  }

  @override
  List<Object?> get props => [status, rewards, wallet, payoutHistory, error];
}
