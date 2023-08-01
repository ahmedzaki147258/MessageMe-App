import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messageapp/controller/registration_controller.dart';
import 'package:messageapp/view/widgets/imagelogo.dart';
import 'package:messageapp/view/widgets/my_button.dart';
import 'package:messageapp/view/widgets/textformfieldtype.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RegistrationController controller = Get.put(RegistrationController());
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
              const TextFormFieldType(hintText: 'Enter your Email', isLogin: false, isEmail: true),
              const SizedBox(height: 8,),
              const TextFormFieldType(hintText: 'Enter your password', isLogin: false, isEmail: false),
              const SizedBox(height: 10,),
              MyButton(title: 'Register', color: Colors.blue[800]!, onPressed: () async{
                try{
                  await controller.auth.createUserWithEmailAndPassword(email: controller.email, password: controller.password);
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
