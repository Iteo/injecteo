import 'package:injecteo/injecteo.dart';
import 'package:todeo/domain/notifiaction/notification_repository.dart';

@inject
class RegisterLocalNotificationUseCase {
  RegisterLocalNotificationUseCase(this._notificationRepository);

  final NotificationRepository _notificationRepository;

  void call() => _notificationRepository.setup();
}
