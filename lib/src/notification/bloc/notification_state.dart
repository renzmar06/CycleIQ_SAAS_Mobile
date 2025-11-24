import 'package:equatable/equatable.dart';
import 'package:cycleiq_saas_mobile/src/notification/model/notification_model.dart';

enum NotificationStatus { initial, loading, success, failure }

class NotificationState extends Equatable {
  final NotificationStatus status;
  final List<NotificationModel> notifications;
  final String? error;

  const NotificationState({
    this.status = NotificationStatus.initial,
    this.notifications = const [],
    this.error,
  });

  NotificationState copyWith({
    NotificationStatus? status,
    List<NotificationModel>? notifications,
    String? error,
  }) {
    return NotificationState(
      status: status ?? this.status,
      notifications: notifications ?? this.notifications,
      error: error,
    );
  }

  @override
  List<Object?> get props => [status, notifications, error];
}
