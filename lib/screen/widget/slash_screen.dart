import 'package:FoodieSathia/constant/constants.dart';
import 'package:FoodieSathia/controller/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:food/controller/splashScreen.dart';
//import 'package:FoodieSathia/con';

class SlashScreen extends StatefulWidget {
  const SlashScreen({Key? key}) : super(key: key);

  @override
  State<SlashScreen> createState() => _SlashScreenState();
}

SplashController _controller = Get.put(SplashController());

class _SlashScreenState extends State<SlashScreen> {
  @override
  void initState() {
    _controller.intiSplashScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              color: Constants.primaryColor,
            ),
            Container(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/logo-foodie.png',
                width:
                    screenSize.width * 0.6, // Adjust the percentage as needed
                height:
                    screenSize.height * 0.6, // Adjust the percentage as needed
              ),
            ),
          ],
        ),
      ),
    );
  }
}
