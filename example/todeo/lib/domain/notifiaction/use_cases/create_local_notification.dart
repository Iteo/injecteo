import 'package:injecteo/injecteo.dart';
import 'package:todeo/domain/notifiaction/notification_repository.dart';

@inject
class CreateLocalNotificationUseCase {
  CreateLocalNotificationUseCase(this._notificationRepository);

  final NotificationRepository _notificationRepository;

  Future<void> call(
    String title,
    String body,
    int endTime,
    String channel,
  ) async =>
      _notificationRepository.createNotification(title, body, endTime, channel);
}
