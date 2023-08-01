import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messageapp/view/widgets/messageline.dart';

class MessageStreamBuilder extends StatelessWidget {
  final User signInUser;
  final FirebaseFirestore firestore;
  const MessageStreamBuilder({Key? key, required this.signInUser, required this.firestore}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: firestore.collection('messages').orderBy('time').snapshots(),
        builder: (context, snapshot){
          List<MessageLine> messageWidgets = [];
          if(!snapshot.hasData){
            return const Center(child: CircularProgressIndicator(color: Colors.blue,));
          }
          final messages = snapshot.data!.docs.reversed;
          for(var message in messages){
            final messageText = message.get('text');
            final messageSender = message.get('sender');
            final currentUser = signInUser.email;
            final messageWidget = MessageLine(text: messageText, sender: messageSender, isMe: currentUser == messageSender,);
            messageWidgets.add(messageWidget);
          }
          return Expanded(
              child: ListView(
                reverse: true,
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                children: messageWidgets,));
        }
    );
  }
}
