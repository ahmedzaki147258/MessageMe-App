import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messageapp/controller/registration_controller.dart';
import 'package:messageapp/controller/signin_controller.dart';

class TextFormFieldType extends StatelessWidget {
  final String hintText;
  final bool isLogin;
  final bool isEmail;
  const TextFormFieldType({
    Key? key,
    required this.hintText,
    required this.isLogin,
    required this.isEmail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller;
    if (isLogin) {
      controller = Get.put(SignInController());
    } else {
      controller = Get.put(RegistrationController());
    }
    return TextFormField(
      textAlign: TextAlign.center,
      onChanged: (value) {
        isEmail ? controller.email = value : controller.password = value;
      },
      keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
      obscureText: !isEmail && isLogin ? true : false,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.orange, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
    );
  }
}
