import 'package:flutter/material.dart';

class MessageLine extends StatelessWidget {
  final String? text;
  final String? sender;
  final bool isMe;
  const MessageLine({Key? key, this.text, this.sender, required this.isMe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text('$sender', style: TextStyle(fontSize: 12, color: Colors.yellow[900]),),
            Material(
                elevation: 5,
                borderRadius: isMe ? const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ):const BorderRadius.only(
                  topRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                color: isMe ? Colors.blue[800] : Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text('$text', style: TextStyle(fontSize: 15, color: isMe ? Colors.white : Colors.black45),),
                )),
          ],)
    );
  }
}
