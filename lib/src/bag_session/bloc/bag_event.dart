abstract class BagEvent {}

class LoadBagsEvent extends BagEvent {
  final String userId;
  LoadBagsEvent(this.userId);
}
