import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';
import '../controllers/conversation_controller.dart';
import '../models/message_model.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key, required this.messageContext});

  final String messageContext;

  @override
  Widget build(BuildContext context) {
    return Consumer<ConversationController>(
      builder: (context, chat, child) => ElevatedButton(
        onPressed: () {
          chat.addMessage(
            Message(
              messageContent: messageContext,
              messageType: MessageType.sender,
            ),
          );
          chat.clearAllButtons();
          chat.botAnswer();
        },
        style: ElevatedButton.styleFrom(backgroundColor: buttonColor),
        child: Text(messageContext),
      ),
    );
  }
}
