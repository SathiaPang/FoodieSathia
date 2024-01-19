import 'package:FoodieSathia/screen/widget/Menu_List/Category/item_view_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Favorite_Screen extends StatefulWidget {
  const Favorite_Screen({super.key});

  @override
  State<Favorite_Screen> createState() => _Favorite_ScreenState();
}

class _Favorite_ScreenState extends State<Favorite_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Favorite'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.swap_horiz_sharp,
                  color: Colors.black,
                  size: 25,
                ),
                SizedBox(width: 5),
                Text('swipe on an item to delete',
                    style: TextStyle(fontSize: 15)),
              ],
            ),
          ),
          Item_List(),
        ],
      ),
    );
  }
}
