import 'package:FoodieSathia/constant/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:FoodieSathia/screen/widget/Menu_List/Profile/Edit_Profile/edit_profile_screen.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Trevor Sathia',
          style: TextStyle(
            fontSize: Get.width * 0.06, // Adjust the font size as needed
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          'trevorsathia12@gmail.com',
          style: TextStyle(
              fontSize: Get.width * 0.04, color: Colors.grey.shade700),
        ),
        Text(
          '+855 987 789 89',
          style: TextStyle(
              fontSize: Get.width * 0.04, color: Colors.grey.shade700),
        ),
        SizedBox(height: Get.height * 0.01),
        InkWell(
          onTap: () {
            Get.to(() => EditProfileScreen());
          },
          child: Container(
            height: Get.height * 0.07, // Adjust the height as needed
            width: Get.width * 0.4, // Adjust the width as needed
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    Get.width * 0.1), // Adjust the border radius as needed
                color: Constants.primaryColor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Edit Profile',
                    style: TextStyle(
                        fontSize:
                            Get.width * 0.045, // Adjust the font size as needed
                        fontWeight: FontWeight.w400,
                        color: Colors.white)),
              ],
            ),
          ),
        )
      ],
    );
  }
}
