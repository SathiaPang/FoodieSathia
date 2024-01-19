import 'dart:async';

import 'package:get/get.dart';
import 'package:FoodieSathia/authentication/login/login_screen.dart';
import 'package:FoodieSathia/controller/auth_controller.dart';
import 'package:FoodieSathia/screen/widget/Menu_List/navigator_Bar.dart';

class SplashController extends GetxController {
  late Timer? _timer;

  void intiSplashScreen() async {
    AuthController authController = Get.put(AuthController());

    _timer = Timer(
      Duration(seconds: 3),
      () => authController.isLogin()
          ? Get.offAll(() => NavigatorBar())
          : Get.offAll(() => LoginScreen()),
    );
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
