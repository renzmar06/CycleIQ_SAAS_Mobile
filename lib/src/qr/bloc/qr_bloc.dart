import 'package:cycleiq_saas_mobile/core/network/network_call/domain/repository/qr_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'qr_event.dart';
import 'qr_state.dart';

class QRBloc extends Bloc<QREvent, QRState> {
  final QRRepository repo;

  QRBloc(this.repo) : super(const QRState()) {
    on<FetchQRCodeEvent>(_fetchQR);
  }

  Future<void> _fetchQR(FetchQRCodeEvent event, Emitter<QRState> emit) async {
    emit(state.copyWith(status: QRStatus.loading));

    final result = await repo.fetchQRCode();

    result.fold(
      (failure) {
        emit(
          state.copyWith(status: QRStatus.error, message: failure.toString()),
        );
      },
      (qrData) {
        emit(
          state.copyWith(
            status: QRStatus.loaded,
            qrId: qrData["qrId"],
            userName: qrData["name"],
          ),
        );
      },
    );
  }
}
