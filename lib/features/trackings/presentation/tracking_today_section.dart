import 'package:flutter/material.dart';
import 'package:lose_it_up_app/constants/app_sizes.dart';
import 'package:lose_it_up_app/utils/extension.dart';

class TrackingTodaySection extends StatefulWidget {
  const TrackingTodaySection({super.key});

  @override
  State<TrackingTodaySection> createState() => _TrackingTodaySectionState();
}

class _TrackingTodaySectionState extends State<TrackingTodaySection> {
  final double kcalsToday = 1500;

  final double carbsToday = 0;

  final double proteinsToday = 0;

  final double fatToday = 0;

  final double kcalsTarget = 2000;

  final double carbsTarget = 220;

  final double proteinsTarget = 220;

  final double fatTarget = 45;

  DateTime time = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      time = time.subtract(const Duration(days: 1));
                    });
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
              const Spacer(),
              Text('${time.month}.${time.day}'),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    setState(() {
                      time = time.add(const Duration(days: 1));
                    });
                  },
                  icon: const Icon(Icons.arrow_forward_ios)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text('carbs'.hardcoded),
                  Text('${carbsToday.toInt()} / ${carbsTarget.toInt()} g'),
                ],
              ),
              Column(
                children: [
                  Text('protein'.hardcoded),
                  Text('${proteinsToday.toInt()} / ${proteinsTarget.toInt()} g'),
                ],
              ),
              Column(
                children: [
                  Text('fat'.hardcoded),
                  Text('${fatToday.toInt()} / ${fatTarget.toInt()} g'),
                ],
              ),
            ],
          ),
          gapH64,
          Container(
            width: double.infinity,
            height: 100,
            decoration: const BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text('You can eat ${kcalsTarget - kcalsToday} kcal'),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
