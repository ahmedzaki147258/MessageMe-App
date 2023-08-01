import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messageapp/controller/welcome_controller.dart';
import 'package:messageapp/view/widgets/imagelogo.dart';
import 'package:messageapp/view/widgets/my_button.dart';

class WelcomeScreen extends StatelessWidget{
  const WelcomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    WelcomeController controller = Get.put(WelcomeController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: const [
                ImageLogo(size: 180),
                Text('MessageMe', style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900, color: Color(0xff2e386b)),
                ),
              ],
            ),
            const SizedBox(height: 30,),
            MyButton(title: 'Sign in', color: Colors.yellow[900]!, onPressed: (){controller.goToSigninPage();}),
            MyButton(title: 'Register', color: Colors.blue[800]!, onPressed: (){controller.goToRegistrationPage();}),
          ],
        ),
      ),
    );
  }
}
