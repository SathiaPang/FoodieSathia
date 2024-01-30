import 'package:FoodieSathia/binding/binding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screen/widget/slash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: ControllerBnding(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: SlashScreen(),
    );
  }
}
