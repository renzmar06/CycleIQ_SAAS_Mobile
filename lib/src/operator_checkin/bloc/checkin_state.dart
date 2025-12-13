enum CheckInStatus { initial, loading, success, failure }

class CheckInState {
  final CheckInStatus status;
  final String? bagQrId;
  final String? message;

  const CheckInState({
    this.status = CheckInStatus.initial,
    this.bagQrId,
    this.message,
  });

  CheckInState copyWith({
    CheckInStatus? status,
    String? bagQrId,
    String? message,
  }) {
    return CheckInState(
      status: status ?? this.status,
      bagQrId: bagQrId ?? this.bagQrId,
      message: message ?? this.message,
    );
  }
}
