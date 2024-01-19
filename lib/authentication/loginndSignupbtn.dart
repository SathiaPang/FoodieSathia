import 'package:FoodieSathia/constant/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login/login_screen.dart';
import 'signup/register_screen.dart';

class Loginandsignupbtn extends StatefulWidget {
  const Loginandsignupbtn({Key? key}) : super(key: key);

  @override
  State<Loginandsignupbtn> createState() => _LoginandsignupbtnState();
}

class _LoginandsignupbtnState extends State<Loginandsignupbtn> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        SizedBox(
          width: size.width * 0.8,
          height: size.height * 0.06,
          child: ElevatedButton(
            onPressed: () {
              Get.to(() => LoginScreen());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Constants.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              "Login".toUpperCase(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: size.width * 0.8, // Adjust width based on screen width
          height: size.height * 0.06, // Adjust height based on screen height
          child: OutlinedButton(
            onPressed: () {
              Get.to(() => SignUpScreen());
            },
            style: OutlinedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 255, 255, 255),
              side: BorderSide(
                width: 2.5,
                color: Constants.primaryColor,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              "Sign Up".toUpperCase(),
              style: TextStyle(
                color: Constants.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
