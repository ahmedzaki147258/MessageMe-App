import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messageapp/controller/signin_controller.dart';
import 'package:messageapp/view/widgets/imagelogo.dart';
import 'package:messageapp/view/widgets/my_button.dart';
import 'package:messageapp/view/widgets/textformfieldtype.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignInController controller = Get.put(SignInController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const ImageLogo(size: 180),
              const SizedBox(height: 50,),
              const TextFormFieldType(hintText: 'Enter your Email', isLogin: true, isEmail: true,),
              const SizedBox(height: 8,),
              const TextFormFieldType(hintText: 'Enter your password', isLogin: true, isEmail: false),
              const SizedBox(height: 10,),
              MyButton(title: 'Sign in', color: Colors.yellow[900]!, onPressed: () async{
                try{
                  await controller.auth.signInWithEmailAndPassword(email: controller.email, password: controller.password);
                  controller.goToChatPage();
                } catch(e){
                  print(e);
                }
              }),
            ],
          ),
        ),
    );
  }
}
