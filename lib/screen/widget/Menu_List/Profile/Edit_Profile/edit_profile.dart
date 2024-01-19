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
          'Julia Edward',
          style: TextStyle(
            fontSize: Get.width * 0.06, // Adjust the font size as needed
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          'juliadEdward123@mail.com',
          style: TextStyle(
              fontSize: Get.width * 0.04, color: Colors.grey.shade700),
        ),
        Text(
          '+123456789',
          style: TextStyle(
              fontSize: Get.width * 0.04, color: Colors.grey.shade700),
        ),
        SizedBox(height: Get.height * 0.01),
        InkWell(
          onTap: () {
            Get.to(EditProfileScreen());
          },
          child: Container(
            height: Get.height * 0.07, // Adjust the height as needed
            width: Get.width * 0.4, // Adjust the width as needed
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    Get.width * 0.1), // Adjust the border radius as needed
                color: Colors.red),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Edit Profile',
                    style: TextStyle(
                        fontSize:
                            Get.width * 0.035, // Adjust the font size as needed
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
