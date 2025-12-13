import 'package:cycleiq_saas_mobile/core/network/network_call/domain/repository/bag_details_repository.dart';
import 'package:cycleiq_saas_mobile/src/bag_details/bloc/bag_details_event.dart';
import 'package:cycleiq_saas_mobile/src/bag_details/bloc/bag_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BagDetailsBloc extends Bloc<BagDetailsEvent, BagDetailsState> {
  final BagDetailsRepository repository;

  BagDetailsBloc({required this.repository}) : super(BagDetailsState()) {
    on<FetchBagDetails>(_fetchBag);
  }

  Future<void> _fetchBag(
    FetchBagDetails event,
    Emitter<BagDetailsState> emit,
  ) async {
    emit(state.copyWith(status: BagDetailsStatus.loading));

    try {
      final result = await repository.getBagByQrId(event.qrId);
      emit(state.copyWith(status: BagDetailsStatus.success, bag: result));
    } catch (e) {
      emit(
        state.copyWith(
          status: BagDetailsStatus.failure,
          error: "Unable to fetch bag details",
        ),
      );
    }
  }
}
