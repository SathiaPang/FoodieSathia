import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:FoodieSathia/authentication/login/login_screen.dart';
import 'package:FoodieSathia/model/authe_model.dart';
import 'package:FoodieSathia/screen/widget/Menu_List/navigator_Bar.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  final box = GetStorage();
  Rx<User> user = User(email: "", password: "").obs;
  RxBool showPassword = true.obs;

  final Remail = TextEditingController();
  final Rpassword = TextEditingController();
  final Rusername = TextEditingController();
  final Lemail = TextEditingController();
  final Lpassword = TextEditingController();

  void register(String username, String email, String password) async {
    if (username == "" || email == "" || password == "") {
      Get.snackbar("Error", "Field null");
    } else {
      user.value = User(email: email, password: password);
      box.write('user', {'email': email, 'password': password});
      Get.snackbar("Succes", "Register success");
    }
  }

  void login(String email, String password) async {
    if (email == "" || password == "") {
      Get.snackbar("Error", "Field null");
    } else {
      final getUser = box.read('user');
      if (email == getUser?['email'] && password == getUser?['password']) {
        Get.offAll(() => NavigatorBar());
        box.write('isLogin', true);
      } else {
        Get.snackbar("Error", "No Account");
      }
    }
  }

  void logout() async {
    box.remove('isLogin');
    Get.offAll(LoginScreen());
  }

  bool isLogin() {
    return box.read('isLogin') ?? false;
  }

  void showHidePass() {
    print("---------Click - Controller");
    showPassword.value = !showPassword.value;
  }
}
