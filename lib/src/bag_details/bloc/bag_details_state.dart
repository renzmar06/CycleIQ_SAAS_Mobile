import 'package:cycleiq_saas_mobile/src/bag_details/model/bag_details.dart';

enum BagDetailsStatus { initial, loading, success, failure }

class BagDetailsState {
  final BagDetailsStatus status;
  final BagDetailsModel? bag;
  final String? error;

  BagDetailsState({
    this.status = BagDetailsStatus.initial,
    this.bag,
    this.error,
  });

  BagDetailsState copyWith({
    BagDetailsStatus? status,
    BagDetailsModel? bag,
    String? error,
  }) {
    return BagDetailsState(
      status: status ?? this.status,
      bag: bag ?? this.bag,
      error: error ?? this.error,
    );
  }
}
