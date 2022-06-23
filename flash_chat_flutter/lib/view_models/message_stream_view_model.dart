import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flash_chat_flutter/services/firebase_service.dart';

import '../models/message_bubble_model.dart';

class MessageStreamViewModel {
  final _service = FirebaseService.singleton;

  Stream<QuerySnapshot<Map<String, dynamic>>> getStreamMessages() {
    return _service.getStreamMessages();
  }

  List<MessageBubble> messagesBubbles(
      Iterable<QueryDocumentSnapshot<Object?>> messages) {
    List<MessageBubble> messagesBubbles = [];
    for (var message in messages) {
      final messageText = message.get('text');
      final messageSender = message.get('sender');
      final currentUser = _service.getEmailFromCurrentUser();
      final messageBubble = MessageBubble(
        text: messageText,
        sender: messageSender,
        isMe: currentUser == messageSender,
      );
      messagesBubbles.add(messageBubble);
    }

    return messagesBubbles;
  }
}
