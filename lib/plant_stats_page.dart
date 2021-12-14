import 'package:flutter/material.dart';
import 'package:flutter_awesome_notifications_tutorial/appbar_title.dart';
import 'package:flutter_awesome_notifications_tutorial/plant_image.dart';
import 'package:flutter_awesome_notifications_tutorial/plant_stats.dart';

class PlantStatsPage extends StatelessWidget {
  const PlantStatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const AppBarTitle()),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Your Plant Stats',
                style: Theme.of(context).textTheme.headline4,
              ),
              const SizedBox(height: 45),
              const PlantImage(),
              const SizedBox(height: 25),
              const PlantStats(),
            ],
          ),
        ),
      ),
    );
  }
}
