import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:messageapp/controller/chat_controller.dart';

class RegistrationController extends GetxController{
  static const String screenRoute = '/registration_screen';
  final auth = FirebaseAuth.instance;
  late String email;
  late String password;

  goToChatPage(){
    Get.offAllNamed(ChatController.screenRoute);
  }
}