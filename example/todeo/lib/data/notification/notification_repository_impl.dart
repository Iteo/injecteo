import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injecteo/injecteo.dart';
import 'package:timezone/data/latest.dart' as tz_data;
import 'package:timezone/timezone.dart' as tz;
import 'package:todeo/core/logger/logger.dart';
import 'package:todeo/domain/notifiaction/notification_repository.dart';

@LazySingleton(as: NotificationRepository)
class NotificationRepositoryImpl implements NotificationRepository {
  NotificationRepositoryImpl();

  final _localNotificationPlugin = FlutterLocalNotificationsPlugin();

  @override
  Future<void> setup() async {
    const androidSetting = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSetting = DarwinInitializationSettings();

    const initSettings = InitializationSettings(
      android: androidSetting,
      iOS: iosSetting,
    );

    await _localNotificationPlugin.initialize(initSettings).then((_) {
      Logger.d('Setup local notification success');
    }).catchError((error) {
      Logger.e('NotificationRepository: $error');
    });
  }

  @override
  Future<void> createNotification(
    String title,
    String body,
    int endTime,
    String channel,
  ) async {
    tz_data.initializeTimeZones();
    final scheduleTime =
        tz.TZDateTime.fromMillisecondsSinceEpoch(tz.local, endTime);

    final androidDetail = AndroidNotificationDetails(
      channel,
      channel,
    );

    const iosDetail = DarwinNotificationDetails();

    final noticeDetail = NotificationDetails(
      iOS: iosDetail,
      android: androidDetail,
    );

    const id = 0;

    await _localNotificationPlugin.zonedSchedule(
      id,
      title,
      body,
      scheduleTime,
      noticeDetail,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
    );
  }

  @override
  void cancelAllNotification() {
    _localNotificationPlugin.cancelAll();
  }
}
