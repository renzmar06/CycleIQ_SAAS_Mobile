import 'package:dartz/dartz.dart';
import 'package:cycleiq_saas_mobile/src/notification/model/notification_model.dart';

abstract class NotificationRepository {
  Future<Either<Exception, List<NotificationModel>>> getNotifications();
  Future<Either<Exception, bool>> deleteNotification(int id);
  Future<Either<Exception, bool>> markAllAsRead();
}
