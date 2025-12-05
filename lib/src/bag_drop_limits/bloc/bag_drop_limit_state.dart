import 'package:equatable/equatable.dart';
import '../model/bag_drop_limit_model.dart';

enum BagDropLimitStatus { initial, loading, loaded, error }

class BagDropLimitState extends Equatable {
  final BagDropLimitStatus status;
  final List<BagDropLimitModel> limits;
  final String? message;

  const BagDropLimitState({
    this.status = BagDropLimitStatus.initial,
    this.limits = const [],
    this.message,
  });

  BagDropLimitState copyWith({
    BagDropLimitStatus? status,
    List<BagDropLimitModel>? limits,
    String? message,
  }) {
    return BagDropLimitState(
      status: status ?? this.status,
      limits: limits ?? this.limits,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [status, limits, message];
}
