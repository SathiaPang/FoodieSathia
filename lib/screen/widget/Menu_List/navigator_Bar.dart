import 'package:FoodieSathia/screen/widget/Home_Screen/home_screen.dart';
import 'package:FoodieSathia/screen/widget/Menu_List/Category/cart.dart';
import 'package:FoodieSathia/screen/widget/Menu_List/Favorite/favorite.dart';
import 'package:FoodieSathia/screen/widget/Menu_List/Notification/nofica_screen.dart';
import 'package:FoodieSathia/screen/widget/Menu_List/Profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';


class NavigatorBar extends StatelessWidget {
  const NavigatorBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Container(
      child: Scaffold(
        body: Obx(() => controller.screens[controller.selectedIndex.value]),
        bottomNavigationBar: Obx(
          () => SalomonBottomBar(
            currentIndex: controller.selectedIndex.value,
            onTap: (index) => controller.selectedIndex.value = index,
            items: controller.bottomBarItems,
          ),
        ),
      ),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    HomeScreen(),
    const Favorite_Screen(),
    Cart_Screen(),
    const NotificationScreen(),
    Profilea_Screen(),
  ];

  final bottomBarItems = [
    SalomonBottomBarItem(
      icon: const Icon(Icons.home),
      title: const Text("Home"),
      selectedColor: Colors.purple,
    ),
    SalomonBottomBarItem(
      icon: const Icon(Icons.favorite_border),
      title: const Text("Favorite"),
      selectedColor: Colors.pink,
    ),
    SalomonBottomBarItem(
      icon: const Icon(Icons.shopping_cart),
      title: const Text("Cart"),
      selectedColor: Colors.orange,
    ),
    SalomonBottomBarItem(
      icon: const Icon(Icons.notifications),
      title: const Text("Notification"),
      selectedColor: Colors.teal,
    ),
    SalomonBottomBarItem(
      icon: const Icon(Icons.person),
      title: const Text("Profile"),
      selectedColor: Colors.teal,
    ),
  ];
}
