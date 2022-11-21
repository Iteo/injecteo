abstract class NotificationRepository {
  void setup();

  Future<void> createNotification(
    String title,
    String body,
    int endTime,
    String channel,
  );

  void cancelAllNotification();
}
