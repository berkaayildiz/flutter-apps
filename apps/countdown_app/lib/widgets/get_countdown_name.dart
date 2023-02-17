import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../controllers/app_controller.dart';

class GetCountdownName extends StatelessWidget {
  const GetCountdownName({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
      child: CupertinoTextField(
        onSubmitted: (value) =>
            Provider.of<AppController>(context, listen: false)
                .countdownCardName = value,
        padding: const EdgeInsets.all(16),
        placeholder: "Enter your countdown name",
        placeholderStyle: const TextStyle(color: Colors.black38),
        style: const TextStyle(color: Colors.black54),
        decoration: BoxDecoration(
          color: CupertinoColors.extraLightBackgroundGray,
          border: Border.all(
            color: CupertinoColors.lightBackgroundGray,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        cursorColor: CupertinoColors.activeBlue,
      ),
    );
  }
}
