import 'package:cycleiq_saas_mobile/core/network/network_call/domain/repository/dropoff_repository.dart';
import 'package:cycleiq_saas_mobile/src/operator_checkin/bloc/checkin_event.dart';
import 'package:cycleiq_saas_mobile/src/operator_checkin/bloc/checkin_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckInBloc extends Bloc<CheckInEvent, CheckInState> {
  final DropOffRepository repository;

  CheckInBloc({required this.repository}) : super(const CheckInState()) {
    on<ResetCheckInEvent>((event, emit) => emit(const CheckInState()));
    on<SubmitOperatorCheckInEvent>(_handleSubmitCheckIn);
  }

  Future<void> _handleSubmitCheckIn(
    SubmitOperatorCheckInEvent event,
    Emitter<CheckInState> emit,
  ) async {
    emit(state.copyWith(status: CheckInStatus.loading));

    try {
      final ok = await repository.submitOperatorCheckIn(event.payload);

      if (ok.isNotEmpty) {
        emit(
          state.copyWith(
            bagQrId: ok,
            status: CheckInStatus.success,
            message: "Session submitted successfully!",
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: CheckInStatus.failure,
            message: "Failed to submit session",
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          status: CheckInStatus.failure,
          message: "Server error, please try again",
        ),
      );
    }
  }
}
