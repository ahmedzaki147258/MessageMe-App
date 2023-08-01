import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messageapp/controller/chat_controller.dart';
import 'package:messageapp/controller/welcome_controller.dart';
import 'package:messageapp/services/myservices.dart';

class MyMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;

  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (myServices.auth.currentUser != null) {
      return const RouteSettings(name: ChatController.screenRoute);
    }else{
      return const RouteSettings(name: WelcomeController.screenRoute);
    }
  }
}