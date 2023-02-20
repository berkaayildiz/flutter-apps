import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../models/message_model.dart';

class MessageBox extends StatelessWidget {
  const MessageBox(this.message, {super.key});

  final Message message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.messageType == MessageType.reciever
          ? Alignment.centerLeft
          : Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.all(6),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: message.messageType == MessageType.reciever
              ? messageBoxRecieverColor
              : messageBoxSenderColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(message.messageContent),
      ),
    );
  }
}
