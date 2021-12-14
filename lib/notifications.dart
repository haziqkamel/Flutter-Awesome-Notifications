import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter_awesome_notifications_tutorial/utils.dart';

Future<void> createPlantNotification() async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: createUniqueId(),
      channelKey: 'basic_channel',
      title:
          '${Emojis.money_money_bag + Emojis.plant_cactus} Buy Plant Food!!!!',
      body: 'Florist at 123 Main St. has 2 in stock',
      bigPicture: 'asset://assets/images/notification_map.png',
      notificationLayout: NotificationLayout.BigPicture,
    ),
  );
}

Future<void> createWaterReminderNotification(
    NotificationWeekAndTime notificationSchedule) async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: createUniqueId(),
      channelKey: 'scheduled_channel',
      title: '${Emojis.wheater_droplet} Add some water to your plant!',
      body: 'Water your plant regularly to keep it healthy',
      notificationLayout: NotificationLayout.Default,
    ),
    actionButtons: [
      NotificationActionButton(
        key: 'MARK_DONE',
        label: 'Mark Done',
      ),
    ],
    schedule: NotificationCalendar(
      repeats: true,
      weekday: notificationSchedule.dayOfTheWeek,
      hour: notificationSchedule.timeOfDay.hour,
      minute: notificationSchedule.timeOfDay.minute,
      second: 0,
      millisecond: 0,
    ),
  );
}

Future<void> cancelScheduleNotifications() async {
  await AwesomeNotifications().cancelAllSchedules();
}
