import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flash_chat_flutter/view_models/message_stream_view_model.dart';
import 'package:flutter/material.dart';

class MessagesStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MessageStreamViewModel viewModel = MessageStreamViewModel();
    return StreamBuilder<QuerySnapshot>(
        stream: viewModel.getStreamMessages(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ),
            );
          }
          final messages = snapshot.data?.docs;
          return Expanded(
            child: ListView(
              reverse: true,
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              children: viewModel.messagesBubbles(messages!),
            ),
          );
        });
  }
}
