import 'package:cycleiq_saas_mobile/core/network/network_call/domain/repository/security_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cycleiq_saas_mobile/src/security/bloc/security_event.dart';
import 'package:cycleiq_saas_mobile/src/security/bloc/security_state.dart';

class SecurityBloc extends Bloc<SecurityEvent, SecurityState> {
  final SecurityRepository repository;

  SecurityBloc({required this.repository}) : super(const SecurityState()) {
    on<LoadSecurityDataEvent>(_onLoad);
    on<UploadProofEvent>(_onUploadProof);
    on<DonateEvent>(_onDonate);
    on<RefreshPayoutHistoryEvent>(_onRefreshPayoutHistory);
  }

  Future<void> _onLoad(
    LoadSecurityDataEvent event,
    Emitter<SecurityState> emit,
  ) async {
    emit(state.copyWith(status: SecurityStatus.loading));
    // parallel fetching is OK, but keep simple sequential for clarity
    final rewardsResult = await repository.getRewards();
    final walletResult = await repository.getWalletBalance();
    final payoutResult = await repository.getPayoutHistory();

    rewardsResult.fold(
      (err) => emit(
        state.copyWith(status: SecurityStatus.failure, error: err.toString()),
      ),
      (rewards) {
        walletResult.fold(
          (err) => emit(
            state.copyWith(
              status: SecurityStatus.failure,
              error: err.toString(),
            ),
          ),
          (wallet) {
            payoutResult.fold(
              (err) => emit(
                state.copyWith(
                  status: SecurityStatus.failure,
                  error: err.toString(),
                ),
              ),
              (payouts) => emit(
                state.copyWith(
                  status: SecurityStatus.success,
                  rewards: rewards,
                  wallet: wallet,
                  payoutHistory: payouts,
                ),
              ),
            );
          },
        );
      },
    );
  }

  Future<void> _onUploadProof(
    UploadProofEvent event,
    Emitter<SecurityState> emit,
  ) async {
    emit(state.copyWith(status: SecurityStatus.uploading));
    final result = await repository.uploadProof(filePath: event.filePath);

    result.fold(
      (err) => emit(
        state.copyWith(status: SecurityStatus.failure, error: err.toString()),
      ),
      (resp) {
        // on success we may refresh data (wallet/payouts) or return to success state
        emit(state.copyWith(status: SecurityStatus.success));
      },
    );
  }

  Future<void> _onDonate(DonateEvent event, Emitter<SecurityState> emit) async {
    emit(state.copyWith(status: SecurityStatus.donating));
    final result = await repository.donate(
      amount: event.amount,
      organizationId: event.organizationId,
    );

    result.fold(
      (err) => emit(
        state.copyWith(status: SecurityStatus.failure, error: err.toString()),
      ),
      (resp) {
        // on success maybe refresh wallet/payouts
        add(const RefreshPayoutHistoryEvent());
      },
    );
  }

  Future<void> _onRefreshPayoutHistory(
    RefreshPayoutHistoryEvent event,
    Emitter<SecurityState> emit,
  ) async {
    final result = await repository.getPayoutHistory();

    result.fold(
      (err) => emit(
        state.copyWith(status: SecurityStatus.failure, error: err.toString()),
      ),
      (payouts) => emit(
        state.copyWith(status: SecurityStatus.success, payoutHistory: payouts),
      ),
    );
  }
}
