import 'package:FoodieSathia/constant/constants.dart';
import 'package:FoodieSathia/screen/widget/Home_Screen/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/data.dart';

class Item_View extends StatelessWidget {
  const Item_View({
    Key? key,
    required this.food,
  }) : super(key: key);

  final FoodRepo food;

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Get.to(() => DetailScreen(
              food: food,
            ));
      },
      child: Container(
        height: double.infinity,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            Container(
              height: Get.height * 0.4,
              width: Get.width * 0.5,
              margin: EdgeInsets.symmetric(
                  horizontal: 0), // Adjust the width as needed
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
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
              child: Column(
                children: [
                  Expanded(
                    child: CircleAvatar(
                      radius: 80,
                      backgroundImage: AssetImage(food.image),
                    ),
                  ),
                  Text(
                    food.subtitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Chicken Popcorn",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      Text(
                        '5',
                        style: TextStyle(fontSize: 17, color: Colors.amber),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '\$ ',
                            style: TextStyle(fontSize: 20, color: Colors.red),
                          ),
                          TextSpan(
                            text: food.price.toString(),
                            style: TextStyle(fontSize: 30, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
