import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messageapp/controller/chat_controller.dart';
import 'package:messageapp/view/widgets/imagelogo.dart';
import 'package:messageapp/view/widgets/messagestreambuilder.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChatController controller = Get.put(ChatController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[900],
        title: Row(
          children: const [
            ImageLogo(size: 25),
            SizedBox(
              width: 10,
            ),
            Text('MessageMe')
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                controller.logout(context);
              },
              icon: const Icon(Icons.exit_to_app_outlined))
        ],
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MessageStreamBuilder(
              signInUser: controller.signInUser,
              firestore: controller.firestore),
          Container(
            decoration: const BoxDecoration(
                border: Border(
                    top: BorderSide(
              color: Colors.orange,
              width: 2,
            ))),
            child: Row(
              children: [
                Expanded(
                    child: TextFormField(
                  controller: controller.messageTextController,
                  onChanged: (value) {
                    controller.messageText = value;
                  },
                  decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      hintText: 'Write your message here...',
                      border: InputBorder.none),
                )),
                TextButton(
                    onPressed: () {
                      controller.messageTextController.clear();
                      controller.firestore.collection('messages').add({
                        'text': controller.messageText,
                        'sender': controller.signInUser.email,
                        'time': FieldValue.serverTimestamp()
                      });
                    },
                    child: Text(
                      'send',
                      style: TextStyle(
                          color: Colors.blue[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ))
              ],
            ),
          )
        ],
      )),
    );
  }
}
