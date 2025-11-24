import 'package:cycleiq_saas_mobile/core/network/network_call/api_config.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/data/data_source/notification_remote_data_source.dart';
import 'package:cycleiq_saas_mobile/core/network/network_call/network_client.dart';

class NotificationRemoteDataSourceImpl implements NotificationRemoteDataSource {
  final NetworkClient networkClient;

  NotificationRemoteDataSourceImpl({required this.networkClient});

  @override
  Future<dynamic> getNotifications() async {
    final response = await networkClient.invoke(
      ApiConfig().getNotifications,
      RequestType.get,
    );
    return response.data;
  }

  @override
  Future<dynamic> deleteNotification(int id) async {
    final response = await networkClient.invoke(
      "${ApiConfig().deleteNotification}/$id",
      RequestType.delete,
    );
    return response.data;
  }

  @override
  Future<dynamic> markAllAsRead() async {
    final response = await networkClient.invoke(
      ApiConfig().markAllNotificationsRead,
      RequestType.post,
    );
    return response.data;
  }
}
