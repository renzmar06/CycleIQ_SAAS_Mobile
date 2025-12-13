abstract class CheckInEvent {}

class ScanOperatorBagEvent extends CheckInEvent {
  final String qr;
  ScanOperatorBagEvent(this.qr);
}

class ResetCheckInEvent extends CheckInEvent {}

class SubmitOperatorCheckInEvent extends CheckInEvent {
  final Map<String, dynamic> payload;
  SubmitOperatorCheckInEvent(this.payload);
}
