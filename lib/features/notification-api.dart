import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationApi {
  static final _notifications = FlutterLocalNotificationsPlugin();

  static Future _notificationDetails() async {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        "ConnectionNotification",
        "Connection Notification",
        channelDescription: "Connection Notification creator.",
        importance: Importance.max,
      ),
    );
  }

  static Future init({bool initScheduled = false}) async {
    final android =
        // ignore: prefer_const_constructors
        AndroidInitializationSettings('@drawable/ic_launcher-playstore.png');

    final settings = InitializationSettings(
      android: android,
    );

    await _notifications.initialize(
      settings,
      onSelectNotification: (payload) async {},
    );
  }

  static Future showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
  }) async {
    _notifications.show(
      id,
      title,
      body,
      await _notificationDetails(),
      payload: payload,
    );
  }
}
