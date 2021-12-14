import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PlantStats extends StatelessWidget {
  const PlantStats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        plantStatsContainer(
            text: '25%',
            faIcon: FontAwesomeIcons.bolt,
            color: Colors.yellow[600]!),
        const SizedBox(width: 10),
        plantStatsContainer(
          text: '80%',
          faIcon: FontAwesomeIcons.tint,
          color: Colors.teal[50]!,
        ),
        const SizedBox(width: 10),
        plantStatsContainer(
          text: '60%',
          faIcon: FontAwesomeIcons.cloudSun,
          color: Colors.yellow[600]!,
        ),
      ],
    );
  }
}

Widget plantStatsContainer(
    {required String text, required IconData faIcon, required Color color}) {
  return Container(
    height: 40,
    width: 100,
    decoration: BoxDecoration(
      color: Colors.teal,
      borderRadius: BorderRadius.circular(30),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FaIcon(
          faIcon,
          size: 20,
          color: color,
        ),
        const SizedBox(width: 3),
        Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}
