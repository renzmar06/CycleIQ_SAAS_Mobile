abstract class RegisterBagsEvent {}

class ScanBagEvent extends RegisterBagsEvent {
  final String qrId;
  ScanBagEvent(this.qrId);
}
