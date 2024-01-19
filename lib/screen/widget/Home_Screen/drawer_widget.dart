import 'package:FoodieSathia/screen/widget/Home_Screen/home_screen.dart';
import 'package:FoodieSathia/screen/widget/Menu_List/Category/cart.dart';
import 'package:FoodieSathia/screen/widget/Menu_List/Favorite/favorite.dart';
import 'package:FoodieSathia/screen/widget/Menu_List/Profile/profile_screen.dart';
import 'package:FoodieSathia/screen/widget/Menu_List/navigator_Bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth_controller.dart';
// import 'package:individual_project/screen/widget/Menu_List/Favorite/Home_Screen.dart';

class Drawer_Widgets extends StatefulWidget {
  const Drawer_Widgets({
    Key? key,
  }) : super(key: key);

  @override
  State<Drawer_Widgets> createState() => _Drawer_WidgetsState();
}

class _Drawer_WidgetsState extends State<Drawer_Widgets> {
  AuthController _authController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red,
      ),
      child: Drawer(
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: ListView(
          shrinkWrap: true,
          children: [
            // Drawer header if needed
            UserAccountsDrawerHeader(
              accountName: const Text('Trevor Sathia'),
              accountEmail: const Text('Trevorsa12@gmail.com'),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/images/image-acc.jpg',
                ),
              ),
              decoration: BoxDecoration(color: Colors.red),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.white),
              title: const Text('Home'),
              textColor: Colors.white,
              onTap: () {
                setState(() {
                  Get.to(NavigatorBar());
                });
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.person,
                color: Colors.white,
              ),
              title: const Text('My Profile'),
              textColor: Colors.white,
              onTap: () {
                setState(() {
                  Get.to(Profilea_Screen());
                });
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.favorite,
                color: Colors.white,
              ),
              title: const Text('My Favourite'),
              textColor: Colors.white,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Favorite_Screen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.shopping_cart_sharp,
                color: Colors.white,
              ),
              title: const Text('Cart'),
              textColor: Colors.white,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Cart_Screen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.notifications,
                color: Colors.white,
              ),
              title: const Text('My Profile'),
              textColor: Colors.white,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Profilea_Screen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.credit_card,
                color: Colors.white,
              ),
              title: const Text('My Cards'),
              textColor: Colors.white,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.settings,
                color: Colors.white,
              ),
              title: const Text('Settings'),
              textColor: Colors.white,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.person,
                color: Colors.white,
              ),
              title: const Text('About us'),
              textColor: Colors.white,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.privacy_tip,
                color: Colors.white,
              ),
              title: const Text('Privacy Policy'),
              textColor: Colors.white,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.content_paste,
                color: Colors.white,
              ),
              title: const Text('Terms & Conditions'),
              textColor: Colors.white,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                // color: Colors.amber,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      _authController.logout();
                    },
                    child: Text(
                      'Log Out',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                  ),
                ),
              ),
            )

            // Add more items as needed
          ],
        ),
      ),
    );
  }
}
