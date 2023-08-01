import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

class MyServices extends GetxService {
  late FirebaseAuth auth;

  Future<MyServices> init() async {
    await Firebase.initializeApp();
    auth = FirebaseAuth.instance;
    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => MyServices().init());
}