import 'package:equatable/equatable.dart';

abstract class NotificationEvent extends Equatable {
  const NotificationEvent();

  @override
  List<Object?> get props => [];
}

class LoadNotificationsEvent extends NotificationEvent {
  const LoadNotificationsEvent();
}

class DeleteNotificationEvent extends NotificationEvent {
  final int id;
  const DeleteNotificationEvent(this.id);

  @override
  List<Object?> get props => [id];
}

class MarkAllAsReadEvent extends NotificationEvent {
  const MarkAllAsReadEvent();
}
