import 'package:flutter/material.dart';

import '../constants/constants.dart';

class CountdownCard extends StatelessWidget {
  const CountdownCard({
    super.key,
    this.days = 0,
    this.hours = 0,
    this.minutes = 0,
    this.seconds = 0,
    this.countdownCardName = "",
  });

  final int? days;
  final int? hours;
  final int? minutes;
  final int? seconds;
  final String? countdownCardName;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 6),
            child: Text(
              "$days",
              style: const TextStyle(
                fontSize: 70,
                color: cardTextColor,
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(13, 13, 13, 12),
                child: Text(
                  countdownCardName!,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: cardTextColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 13),
                child: Text(
                  "days $hours hours $minutes minutes $seconds seconds",
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: cardTextColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
