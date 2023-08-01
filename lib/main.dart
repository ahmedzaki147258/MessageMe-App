import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messageapp/controller/chat_controller.dart';
import 'package:messageapp/controller/registration_controller.dart';
import 'package:messageapp/controller/signin_controller.dart';
import 'package:messageapp/controller/welcome_controller.dart';
import 'package:messageapp/services/mymiddleware.dart';
import 'package:messageapp/services/myservices.dart';
import 'package:messageapp/view/screens/chat.dart';
import 'package:messageapp/view/screens/registration.dart';
import 'package:messageapp/view/screens/signin.dart';
import 'package:messageapp/view/screens/welcome.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'MessageMe app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
        GetPage(name: "/", page: () => const WelcomeScreen(), middlewares: [MyMiddleWare()]),
        GetPage(name: WelcomeController.screenRoute, page: () => const WelcomeScreen()),
        GetPage(name: SignInController.screenRoute, page: () => const SignInScreen()),
        GetPage(name: RegistrationController.screenRoute, page: () => const RegistrationScreen()),
        GetPage(name: ChatController.screenRoute, page: () => const ChatScreen()),
      ],
    );
  }
}
