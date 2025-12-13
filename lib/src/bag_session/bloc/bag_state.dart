import 'package:cycleiq_saas_mobile/src/bag_session/model/bag_model.dart';

enum BagStatus { initial, loading, success, failure }

class BagState {
  final BagStatus status;
  final List<BagModel> bags;
  final String? error;

  const BagState({
    this.status = BagStatus.initial,
    this.bags = const [],
    this.error,
  });

  BagState copyWith({BagStatus? status, List<BagModel>? bags, String? error}) {
    return BagState(
      status: status ?? this.status,
      bags: bags ?? this.bags,
      error: error,
    );
  }
}
