import 'package:cycleiq_saas_mobile/core/network/network_call/domain/repository/dropoff_repository.dart';
import 'package:cycleiq_saas_mobile/src/dropoff_location/bloc/dropoff_event.dart';
import 'package:cycleiq_saas_mobile/src/dropoff_location/bloc/dropoff_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DropOffBloc extends Bloc<DropOffEvent, DropOffState> {
  final DropOffRepository repository;

  DropOffBloc({required this.repository}) : super(DropOffState()) {
    on<FetchDropOffLocations>(_fetch);
  }

  Future<void> _fetch(
    FetchDropOffLocations event,
    Emitter<DropOffState> emit,
  ) async {
    emit(state.copyWith(status: DropOffStatus.loading));

    try {
      final locations = await repository.getLocations();
      emit(state.copyWith(status: DropOffStatus.success, locations: locations));
    } catch (e) {
      emit(state.copyWith(status: DropOffStatus.failure, error: e.toString()));
    }
  }
}
