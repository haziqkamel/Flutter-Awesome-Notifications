import 'dart:io';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_awesome_notifications_tutorial/home_page_buttons.dart';
import 'package:flutter_awesome_notifications_tutorial/notifications.dart';
import 'package:flutter_awesome_notifications_tutorial/plant_image.dart';
import 'package:flutter_awesome_notifications_tutorial/plant_stats_page.dart';
import 'package:flutter_awesome_notifications_tutorial/utils.dart';

import 'appbar_title.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      // print('isAllowed: $isAllowed');
      if (!isAllowed) {
        // print(isAllowed);
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Allow Notifications'),
            content: const Text('Our app would like to send you notifications'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  'Don\'t Allow',
                  style: TextStyle(color: Colors.grey, fontSize: 15.0),
                ),
              ),
              TextButton(
                onPressed: () => AwesomeNotifications()
                    .requestPermissionToSendNotifications()
                    .then((_) => Navigator.pop(context)),
                child: const Text(
                  'Allow',
                  style: TextStyle(
                      color: Colors.teal,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        );
      }
    });

    AwesomeNotifications().createdStream.listen((receivedNotification) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              'Notification Created on ${receivedNotification.channelKey}')));
    });

    AwesomeNotifications().actionStream.listen((receivedAction) {
      //Reset the GlobalBadgeCounter for iOS platform
      if (receivedAction.channelKey == 'basic_channel' && Platform.isIOS) {
        AwesomeNotifications().getGlobalBadgeCounter().then(
            (value) => AwesomeNotifications().setGlobalBadgeCounter(value - 1));
      }
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const PlantStatsPage()),
          (route) => route.isFirst);
    });
  }

  @override
  void dispose() {
    //Close ActionStream
    AwesomeNotifications().actionSink.close();
    //Close CreatedStream
    AwesomeNotifications().createdSink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const AppBarTitle(),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const PlantStatsPage())),
            icon: const Icon(
              Icons.insert_chart_outlined_rounded,
              size: 30.0,
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const PlantImage(),
            const SizedBox(height: 25),
            HomePageButtons(
              onPressedOne: createPlantNotification,
              onPressedTwo: () async {
                NotificationWeekAndTime? pickedSchedule =
                    await pickSchedule(context);

                if (pickedSchedule != null) {
                  createWaterReminderNotification(pickedSchedule);
                }
              },
              onPressedThree: cancelScheduleNotifications,
            ),
          ],
        ),
      ),
    );
  }
}
