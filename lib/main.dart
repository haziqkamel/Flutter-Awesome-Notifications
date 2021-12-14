import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_awesome_notifications_tutorial/home_page.dart';

void main() {
  //Initialize awesome_notifications
  AwesomeNotifications().initialize(
    'resource://drawable/res_notification_app_icon',
    [
      //Create Notification on demand
      NotificationChannel(
        channelKey: 'basic_channel',
        channelName: 'Basic Notifications',
        channelDescription: 'Basic Description',
        defaultColor: Colors.teal,
        importance: NotificationImportance.High,
        channelShowBadge: true,
      ),
      //Schedule Notifications
      NotificationChannel(
        channelKey: 'scheduled_channel',
        channelName: 'Scheduled Notifications',
        channelDescription: 'Scheduled Notifications Description',
        defaultColor: Colors.teal,
        locked: true,
        importance: NotificationImportance.High,
        soundSource: 'resource://raw/res_custom_notification',
      )
    ],
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(primary: Colors.teal, secondary: Colors.tealAccent)),
      home: const HomePage(),
    );
  }
}
