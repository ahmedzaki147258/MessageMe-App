import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messageapp/controller/welcome_controller.dart';

class ChatController extends GetxController{
  static const String screenRoute = '/chat_screen';
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  late User signInUser;
  final messageTextController = TextEditingController();
  String? messageText;

  @override
  void onInit() {
    getCurrentUser();
    super.onInit();
  }

  void getCurrentUser(){
    try{
      final user = auth.currentUser;
      if(user != null){
        signInUser = user;
      }
    } catch(e){
      print(e);
    }
  }

  logout(BuildContext context) async{
    await showDialog<bool>(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          insetPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text('Confirm Logout!'),
          content: const Text(
            'Are you sure you want to log out\nfrom the application?',
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: () async {
                auth.signOut();
                Get.offAllNamed(WelcomeController.screenRoute);
              },
              child: const Text(
                'Yes',
                style: TextStyle(color: Colors.red),
              ),
            ),
            TextButton(
              onPressed: () {
                Get.back(result: false);
              },
              child: const Text('No'),
            ),
          ],
        );
      },
    );
  }
}