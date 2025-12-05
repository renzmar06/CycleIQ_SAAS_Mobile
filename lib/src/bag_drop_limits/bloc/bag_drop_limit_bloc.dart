import 'package:cycleiq_saas_mobile/core/network/network_call/domain/repository/bag_drop_limit_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bag_drop_limit_event.dart';
import 'bag_drop_limit_state.dart';

class BagDropLimitBloc extends Bloc<BagDropLimitEvent, BagDropLimitState> {
  final BagDropLimitRepository repository;

  BagDropLimitBloc({required this.repository})
    : super(const BagDropLimitState()) {
    on<LoadBagDropLimitsEvent>(_onLoadLimits);
  }

  Future<void> _onLoadLimits(
    LoadBagDropLimitsEvent event,
    Emitter<BagDropLimitState> emit,
  ) async {
    try {
      emit(state.copyWith(status: BagDropLimitStatus.loading));

      final limits = await repository.fetchLimits();

      emit(state.copyWith(status: BagDropLimitStatus.loaded, limits: limits));
    } catch (e) {
      emit(
        state.copyWith(
          status: BagDropLimitStatus.error,
          message: "Failed to load limits",
        ),
      );
    }
  }
}
