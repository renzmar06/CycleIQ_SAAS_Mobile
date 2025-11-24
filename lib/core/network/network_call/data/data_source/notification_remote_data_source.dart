abstract class NotificationRemoteDataSource {
  Future<dynamic> getNotifications();
  Future<dynamic> deleteNotification(int id);
  Future<dynamic> markAllAsRead();
}
