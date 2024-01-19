import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:FoodieSathia/screen/widget/Menu_List/Profile/Edit_Profile/change_passwors_screen.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: Get.height * 0.05,
            horizontal: Get.width * 0.04,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: Get.height * 0.2,
                width: double.infinity,
                child: Stack(
                  children: [
                    Container(
                      height: Get.height * 0.125,
                      width: double.infinity,
                      color: Colors.red,
                    ),
                    Center(
                      child: Container(
                        padding: EdgeInsets.all(Get.width * 0.01),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(Get.width * 0.1),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: Get.width * 0.005,
                              blurRadius: Get.width * 0.01,
                              offset: Offset(0, Get.width * 0.015),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(Get.width * 0.1),
                          child: SizedBox.fromSize(
                            size: Size.fromRadius(Get.width * 0.15),
                            child: Image.asset(
                              'lib/assets/images/profile.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  labelText: 'Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none),
                ),
                cursorHeight: 20,
              ),
              SizedBox(height: Get.height * 0.02),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  labelText: 'Email',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none),
                ),
                cursorHeight: 20,
              ),
              SizedBox(height: Get.height * 0.02),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none),
                ),
                cursorHeight: 20,
              ),
              SizedBox(
                height: Get.height / 40,
              ),
              InkWell(
                onTap: () {
                  Get.to(ChangePasswordScreen());
                },
                child: Padding(
                  padding: EdgeInsets.all(
                      Get.width * 0.02), // Adjust padding as needed
                  child: Container(
                    height: Get.height * 0.07, // Adjust the height as needed
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Get.width *
                          0.02), // Adjust the border radius as needed
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade400,
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Change Password',
                          style: TextStyle(
                            fontSize: Get.width * 0.04,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: Get.width * 0.35,
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * 0.1,
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.all(
                      Get.width * 0.02), // Adjust padding as needed
                  child: Container(
                    height: Get.height * 0.07, // Adjust the height as needed
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Get.width *
                          0.02), // Adjust the border radius as needed
                      color: Colors.red,
                    ),
                    child: Center(
                      child: Text(
                        'Save',
                        style: TextStyle(
                          fontSize: Get.width * 0.05,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
