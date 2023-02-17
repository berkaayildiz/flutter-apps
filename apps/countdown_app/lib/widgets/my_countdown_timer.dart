import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/index.dart';

import '../constants/constants.dart';
import '../models/countdown_card_model.dart';
import '/widgets/countdown_card.dart';

class MyCountdownTimer extends StatelessWidget {
  const MyCountdownTimer({super.key, required this.data});

  final CountdownCardData data;

  @override
  Widget build(BuildContext context) {
    return CountdownTimer(
      endTime: data.dateTime.millisecondsSinceEpoch,
      widgetBuilder: (context, time) {
        if (time == null) {
          return Card(
            color: cardBackgroundColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  "${data.countdownCardName} IS OVER",
                  style: const TextStyle(
                      fontSize: 40, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          );
        }
        return CountdownCard(
          days: time.days ?? 0,
          hours: time.hours ?? 0,
          minutes: time.min ?? 0,
          seconds: time.sec ?? 0,
          countdownCardName: data.countdownCardName,
        );
      },
    );
  }
}
