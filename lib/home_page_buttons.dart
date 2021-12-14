import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePageButtons extends StatelessWidget {
  const HomePageButtons({
    Key? key,
    required this.onPressedOne,
    required this.onPressedTwo,
    required this.onPressedThree,
  }) : super(key: key);

  final Future<void> Function() onPressedOne;
  final Future<void> Function() onPressedTwo;
  final Future<void> Function() onPressedThree;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          customButton(
              onPress: onPressedOne,
              icon: FontAwesomeIcons.dollarSign,
              buttonColor: Colors.teal[600]!,
              text: 'Plant Food'),
          const SizedBox(width: 8),
          customButton(
              onPress: onPressedTwo,
              icon: FontAwesomeIcons.tint,
              buttonColor: Colors.teal[600]!,
              text: 'Water'),
          const SizedBox(width: 8),
          customButton(
            onPress: onPressedThree,
            icon: FontAwesomeIcons.solidTimesCircle,
            buttonColor: Colors.teal[600]!,
            text: 'Cancel',
          ),
        ],
      ),
    );
  }
}

Widget customButton({
  required VoidCallback onPress,
  required IconData icon,
  required Color buttonColor,
  required String text,
}) {
  return Expanded(
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          primary: buttonColor),
      onPressed: onPress,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(
            icon,
            size: 14.0,
            color: Colors.teal[50],
          ),
          const SizedBox(width: 2),
          Text(
            text,
            style: const TextStyle(fontSize: 15),
          ),
        ],
      ),
    ),
  );
}
