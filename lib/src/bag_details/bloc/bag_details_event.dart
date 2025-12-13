abstract class BagDetailsEvent {}

class FetchBagDetails extends BagDetailsEvent {
  final String qrId;
  FetchBagDetails(this.qrId);
}
