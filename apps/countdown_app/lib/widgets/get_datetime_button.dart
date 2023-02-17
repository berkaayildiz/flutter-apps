import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';
import '../controllers/app_controller.dart';

class GetDateTimeButton extends StatelessWidget {
  const GetDateTimeButton({super.key});

//
  Future<DateTime?> pickDate(context) {
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
  }

// Gets the time of the countdown event.
  Future<TimeOfDay?> pickTime(context) {
    return showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Card(
        color: iconColor,
        child: Consumer<AppController>(
          builder: (context, controller, child) {
            return IconButton(
              onPressed: () async {
                //
                // Gets the date and sends it to controller.
                DateTime? newDate = await pickDate(context);
                if (newDate == null) return; // Pressed CANCEL.

                //
                // Gets the time and sends it to controller.
                TimeOfDay? newTime;
                if (context.mounted) {
                  newTime = await pickTime(context);
                }
                if (newTime == null) return; // Pressed CANCEL.

                controller.dateTime = DateTime(
                  newDate.year,
                  newDate.month,
                  newDate.day,
                  newTime.hour,
                  newTime.minute,
                );
              },
              icon: dateTimeIcon,
              iconSize: 40,
            );
          },
        ),
      ),
    );
  }
}
