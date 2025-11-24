import 'package:cycleiq_saas_mobile/core/di/injection_container_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/notification_bloc.dart';
import '../bloc/notification_event.dart';
import '../bloc/notification_state.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          serviceLocator<NotificationBloc>()..add(LoadNotificationsEvent()),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: Container(),
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            "Notifications",
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                context.read<NotificationBloc>().add(MarkAllAsReadEvent());
              },
              child: const Text(
                "Mark all as read",
                style: TextStyle(color: Colors.green),
              ),
            ),
          ],
        ),
        body: BlocBuilder<NotificationBloc, NotificationState>(
          builder: (context, state) {
            if (state.status == NotificationStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.notifications.isEmpty) {
              return const Center(child: Text("No notifications"));
            }

            return ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: state.notifications.length,
              itemBuilder: (context, index) {
                final notif = state.notifications[index];

                return Dismissible(
                  key: Key(notif.id.toString()),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    padding: const EdgeInsets.only(right: 20),
                    alignment: Alignment.centerRight,
                    color: Colors.red.shade400,
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  onDismissed: (_) {
                    context.read<NotificationBloc>().add(
                      DeleteNotificationEvent(notif.id),
                    );
                  },
                  child: _notificationTile(notif),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _notificationTile(notif) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: notif.isRead
            ? Colors.grey.shade100
            : Colors.green.withOpacity(0.12),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(Icons.notifications_active_outlined, color: Colors.green),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notif.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  notif.message,
                  style: const TextStyle(color: Colors.black54),
                ),
                const SizedBox(height: 4),
                Text(
                  notif.time,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
