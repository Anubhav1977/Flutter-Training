import 'dart:developer';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';

class LocalNotificationWidegt extends StatefulWidget {
  const LocalNotificationWidegt({Key? key}) : super(key: key);

  @override
  State<LocalNotificationWidegt> createState() =>
      _LocalNotificationWidegtState();
}

class _LocalNotificationWidegtState extends State<LocalNotificationWidegt> {
  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('example.com.FlutterLogo');

    var initializationSettingsIOS = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      requestCriticalPermission: true,
    );

    // onDidReceiveLocalNotification:
    //     (int id, String? title, String? body, String? payload) async {});

    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

    bool? initialized =
        await notificationsPlugin.initialize(initializationSettings);
    log("Notification : $initialized");
  }

  void showNotification() {
    AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
        "Notifications-testing", "Test Notification",
        priority: Priority.max, importance: Importance.max);

    DarwinNotificationDetails iosDetails = DarwinNotificationDetails(
        presentAlert: true, presentBadge: true, presentSound: true);

    NotificationDetails notificationDetails =
        NotificationDetails(android: androidDetails, iOS: iosDetails);

    notificationsPlugin.show(
        0, "Test Notification", "This is a notification", notificationDetails);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showNotification();
          },
          child: Text("Press Meh !!"),
        ),
      ),
    );
  }
}
