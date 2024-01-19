import 'package:FoodieSathia/constant/constants.dart';
import 'package:FoodieSathia/screen/widget/Home_Screen/Search/seemore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SearchField extends StatelessWidget {
  SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                Get.to(() => SeeMoreScreen());
              },
              child: Container(
                height: Get.height / 20,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [Icon(Icons.search), Text("Search")],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 25,
          ),
          InkWell(
            onTap: () {
              Get.to(() => SeeMoreScreen());
            },
            child: Container(
              width: 50,
              height: 50,
              transform: Matrix4.rotationZ(45 * 3.1415927 / 180),
              decoration: BoxDecoration(
                color: Constants.primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              transformAlignment: Alignment.center,
              child: Transform.rotate(
                angle: 5.5,
                child: Center(
                  child: Image.asset(
                    'assets/images/image-catergory.png',
                    width: 25,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
