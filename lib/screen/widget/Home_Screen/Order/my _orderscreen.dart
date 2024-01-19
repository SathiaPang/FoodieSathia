import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../tabbar.dart';

class MyOrder extends StatelessWidget {
  MyOrder({super.key});

  IconData _getIcon(String category) {
    switch (category) {
      case "Current":
        return Icons.fastfood;
      case "Complete":
        return Icons.done;
      case "Cancelled":
        return Icons.cancel;
      default:
        return Icons.category;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Order'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomTabBar(
              categories: ["Current", "Complete", "Cancelled"],
              onTabChanged: (selectedCategory) {},
              getIcon: _getIcon,
            ),
          ],
        ),
      ),
    );
  }
}
