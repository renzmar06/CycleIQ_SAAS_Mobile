import 'dart:developer';

import 'package:cycleiq_saas_mobile/core/network/network_call/domain/repository/dropoff_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'register_bags_event.dart';
import 'register_bags_state.dart';

class RegisterBagsBloc extends Bloc<RegisterBagsEvent, RegisterBagsState> {
  final DropOffRepository repository;

  RegisterBagsBloc({required this.repository})
    : super(const RegisterBagsState()) {
    on<ScanBagEvent>(_handleScanBag);
  }

  Future<void> _handleScanBag(
    ScanBagEvent event,
    Emitter<RegisterBagsState> emit,
  ) async {
    emit(state.copyWith(status: RegisterBagStatus.loading));

    try {
      final bag = await repository.getBagInfo(event.qrId);
      log("ndshdbhsb${bag.bagQrId}");
      emit(
        state.copyWith(
          status: RegisterBagStatus.success,
          message: "Bag ${event.qrId} registered successfully",
          registeredBags: [...state.registeredBags, bag],
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: RegisterBagStatus.failure,
          message: "Failed to register ${event.qrId}",
        ),
      );
    }
  }
}
