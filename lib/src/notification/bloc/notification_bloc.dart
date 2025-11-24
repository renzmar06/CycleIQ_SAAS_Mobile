import 'package:cycleiq_saas_mobile/core/network/network_call/domain/repository/notification_repository.dart';
import 'package:cycleiq_saas_mobile/src/notification/model/notification_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cycleiq_saas_mobile/src/notification/bloc/notification_event.dart';
import 'package:cycleiq_saas_mobile/src/notification/bloc/notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final NotificationRepository profileRepository;

  NotificationBloc({required this.profileRepository})
    : super(const NotificationState()) {
    on<LoadNotificationsEvent>(_onLoadNotifications);
    on<DeleteNotificationEvent>(_onDeleteNotification);
    on<MarkAllAsReadEvent>(_onMarkAllAsRead);
  }

  Future<void> _onLoadNotifications(
    LoadNotificationsEvent event,
    Emitter<NotificationState> emit,
  ) async {
    emit(state.copyWith(status: NotificationStatus.loading));

    final result = await profileRepository.getNotifications();

    result.fold(
      (error) => emit(
        state.copyWith(
          status: NotificationStatus.failure,
          error: error.toString(),
        ),
      ),
      (list) {
        final typedList = list.map((e) => e).toList();

        emit(
          state.copyWith(
            status: NotificationStatus.success,
            notifications: typedList,
          ),
        );
      },
    );
  }

  Future<void> _onDeleteNotification(
    DeleteNotificationEvent event,
    Emitter<NotificationState> emit,
  ) async {
    final result = await profileRepository.deleteNotification(event.id);

    result.fold(
      (error) => emit(
        state.copyWith(
          status: NotificationStatus.failure,
          error: error.toString(),
        ),
      ),
      (_) {
        final currentList = state.notifications.map((e) => e).toList();

        final updatedList = currentList
            .where((item) => item.id != event.id)
            .toList();

        emit(
          state.copyWith(
            status: NotificationStatus.success,
            notifications: updatedList,
          ),
        );
      },
    );
  }

  Future<void> _onMarkAllAsRead(
    MarkAllAsReadEvent event,
    Emitter<NotificationState> emit,
  ) async {
    final result = await profileRepository.markAllAsRead();

    result.fold(
      (error) => emit(
        state.copyWith(
          status: NotificationStatus.failure,
          error: error.toString(),
        ),
      ),
      (_) {
        final updatedList = state.notifications
            .map(
              (e) => NotificationModel(
                id: e.id,
                title: e.title,
                message: e.message,
                time: e.time,
                isRead: true,
              ),
            )
            .toList();

        emit(
          state.copyWith(
            status: NotificationStatus.success,
            notifications: updatedList,
          ),
        );
      },
    );
  }
}
