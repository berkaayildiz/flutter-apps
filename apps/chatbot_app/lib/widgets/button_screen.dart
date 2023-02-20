import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/conversation_controller.dart';
import '../constants/constants.dart';
import 'answer_button.dart';

class ButtonScreen extends StatelessWidget {
  const ButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ConversationController>(builder: (context, chat, child) {
      return Container(
        padding: const EdgeInsets.only(top: 8, bottom: 20),
        decoration: BoxDecoration(
          color: layoutColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: chat.answersList
              .map(
                (answer) => Center(
                  child: AnswerButton(messageContext: answer),
                ),
              )
              .toList(),
        ),
      );
    });
  }
}
