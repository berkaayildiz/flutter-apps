enum MessageType {
  sender,
  reciever,
}

/// Message object.
///
/// [messageContent] holds the context of the message.
/// [messageType] indicates who sent the message. Can only take two parameters;
/// [sender] or [reciever].
///
class Message {
  String messageContent;
  Enum messageType;
  Message({required this.messageContent, required this.messageType});
}
