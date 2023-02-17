import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';
import '../controllers/app_controller.dart';

class CreateCountdownButton extends StatelessWidget {
  const CreateCountdownButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Card(
        color: iconColor,
        child: Consumer<AppController>(
          builder: (context, controller, child) {
            return IconButton(
              onPressed: () {
                if (controller.dateTime != null &&
                    controller.countdownCardName != null) {
                  controller.addCountdownCard();
                }
              },
              icon: doneButton,
              iconSize: 40,
            );
          },
        ),
      ),
    );
  }
}
