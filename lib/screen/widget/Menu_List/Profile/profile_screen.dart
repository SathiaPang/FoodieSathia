import 'package:FoodieSathia/screen/widget/Menu_List/Favorite/favorite.dart';
import 'package:FoodieSathia/screen/widget/Menu_List/Profile/Edit_Profile/edit_profile.dart';
import 'package:FoodieSathia/screen/widget/Menu_List/Profile/button_change.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Home_Screen/Order/choose-address.dart';
import '../../Home_Screen/Order/my _orderscreen.dart';
import 'Edit_Profile/coupons.dart';

class Profilea_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: Get.height * 0.05, horizontal: Get.width * 0.02),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: Get.height * 0.2,
              width: double.infinity,
              child: Stack(
                children: [
                  Container(
                    height: Get.height * 0.5,
                    width: double.infinity,
                    child: Image.asset(
                      'assets/images/profile_background.gif',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Center(
                    child: Container(
                      padding: EdgeInsets.all(Get.width * 0.01),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Get.width * 0.1),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(Get.width * 0.1),
                        child: SizedBox.fromSize(
                          size: Size.fromRadius(Get.width * 0.15),
                          child: Image.asset(
                            'assets/images/image-acc.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            EditProfile(),
            SizedBox(
              height: Get.height * 0.02,
            ),
            CustomButtons(
                onTap: () {
                  Get.to(MyOrder());
                },
                title: 'My Order'),
            CustomButtons(
                onTap: () {
                  Get.to(Address());
                },
                title: 'My Address'),
            CustomButtons(
                onTap: () {
                  Get.to(Favorite_Screen());
                },
                title: 'My Favorite'),
            CustomButtons(
                onTap: () {
                  Get.to(CouponsScreen());
                },
                title: 'Coupons'),
          ],
        ),
      ),
    );
  }
}
