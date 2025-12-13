import 'package:cycleiq_saas_mobile/core/network/network_call/domain/repository/bag_details_repository.dart';
import 'package:cycleiq_saas_mobile/src/bag_session/bloc/bag_event.dart';
import 'package:cycleiq_saas_mobile/src/bag_session/bloc/bag_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BagBloc extends Bloc<BagEvent, BagState> {
  final BagDetailsRepository repository;

  BagBloc({required this.repository}) : super(const BagState()) {
    on<LoadBagsEvent>(_loadBags);
  }

  Future<void> _loadBags(LoadBagsEvent event, Emitter<BagState> emit) async {
    emit(state.copyWith(status: BagStatus.loading));

    try {
      final bags = await repository.getBags(event.userId);
      emit(state.copyWith(status: BagStatus.success, bags: bags));
    } catch (e) {
      emit(
        state.copyWith(status: BagStatus.failure, error: "Failed to load bags"),
      );
    }
  }
}
