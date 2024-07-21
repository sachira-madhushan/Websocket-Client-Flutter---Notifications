import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class NotificationController {
  static Future<void> initializeLocalNotifications() async {
    await AwesomeNotifications().initialize(
      null, // Use app icon as the notification icon
      [
        NotificationChannel(
          channelKey: 'alerts',
          channelName: 'Alerts',
          channelDescription: 'Notification tests as alerts',
          playSound: true,
          importance: NotificationImportance.High,
          defaultPrivacy: NotificationPrivacy.Private,
          defaultColor:Colors.deepPurple,
          ledColor: Colors.deepPurple,
        )
      ],
      debug: true,
    );
  }

  static Future<void> createNewNotification({
    required title,
    required description
  }) async {
  
    bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
    if (!isAllowed) {
      isAllowed = await AwesomeNotifications().requestPermissionToSendNotifications();
    }
    if (!isAllowed) return;

    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: -1,
        channelKey: 'alerts',
        title: title,
        body: description,
        bigPicture: "https://media.licdn.com/dms/image/C4E12AQFspNpcdXjTRg/article-cover_image-shrink_600_2000/0/1635698781408?e=2147483647&v=beta&t=P8j79U4pVHFWSY26XSJ16WIHL5HGEyiOJ0GarhwiGHo",
        largeIcon:"https://static-00.iconduck.com/assets.00/flutter-icon-2048x2048-ufx4idi8.png",
        notificationLayout:NotificationLayout.BigPicture
      ),
    );
  }
}