import 'package:get/get.dart';
import 'package:messageapp/controller/registration_controller.dart';
import 'package:messageapp/controller/signin_controller.dart';

class WelcomeController extends GetxController{
  static const String screenRoute = '/welcome_screen';

  goToSigninPage(){
    Get.toNamed(SignInController.screenRoute);
  }

  goToRegistrationPage(){
    Get.toNamed(RegistrationController.screenRoute);
  }
}
