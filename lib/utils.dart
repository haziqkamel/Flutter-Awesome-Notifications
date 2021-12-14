import 'package:flutter/material.dart';

int createUniqueId() {
  return DateTime.now().millisecondsSinceEpoch.remainder(100000);
}

class NotificationWeekAndTime {
  final int dayOfTheWeek;
  final TimeOfDay timeOfDay;
  NotificationWeekAndTime({
    required this.dayOfTheWeek,
    required this.timeOfDay,
  });
}

Future<NotificationWeekAndTime?> pickSchedule(BuildContext context) async {
  List<String> weekdays = [
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun',
  ];

  TimeOfDay? timeOfDay;
  DateTime now = DateTime.now();
  int? selectedDay;

  await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'I want to be remided every:',
            textAlign: TextAlign.center,
          ),
          content: Wrap(
            alignment: WrapAlignment.center,
            spacing: 1.5,
            children: [
              for (int e = 0; e < weekdays.length; e++)
                ElevatedButton(
                  onPressed: () {
                    selectedDay = e + 1;
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.teal)),
                  child: Text(weekdays[e]),
                )
            ],
          ),
        );
      });

  if (selectedDay != null) {
    timeOfDay = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(
          now.add(
            const Duration(minutes: 1),
          ),
        ),
        builder: (BuildContext context, Widget? child) {
          return Theme(
              data: ThemeData(
                  colorScheme: const ColorScheme.light(primary: Colors.teal)),
              child: child!);
        });
    if (timeOfDay != null) {
      return NotificationWeekAndTime(
          dayOfTheWeek: selectedDay!, timeOfDay: timeOfDay);
    }
  }
  return null;
}
