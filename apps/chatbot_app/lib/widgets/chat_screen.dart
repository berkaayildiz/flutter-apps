import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/conversation_controller.dart';
import 'message_box.dart';

final ScrollController _scrollController = ScrollController();

_scrollToBottom() {
  _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
}

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ConversationController>(builder: (context, chat, child) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
      return ListView(
        // TODO: Bottom padding'i dinamik olarak bottomSheet height kadar yap.
        padding: const EdgeInsets.only(top: 115, bottom: 180),
        controller: _scrollController,
        children: chat.messagesList
            .map(
              (message) => MessageBox(message),
            )
            .toList(),
      );
    });
  }
}
