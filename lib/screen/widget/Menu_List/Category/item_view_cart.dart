import 'package:FoodieSathia/controller/fav_controller.dart';
import 'package:FoodieSathia/data/data.dart';
import 'package:FoodieSathia/repositary/repo_controller.dart';
import 'package:FoodieSathia/screen/widget/Home_Screen/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Item_Controller extends GetxController {
  final productStorage = ProductStorage.instance;
  final cartList = <FoodRepo>[].obs;

  void getCartList() async {
    final list = await productStorage.getProductItems("CartItem");
    cartList.value = list;
    update();
  }

  Future<void> deleteFromCart(FoodRepo foodRepo) async {
    final index =
        cartList.indexWhere((element) => element.subtitle == foodRepo.subtitle);
    if (index != -1) {
      cartList.removeAt(index);
      await productStorage.putFoodDetails(cartList, "CartItem");
      print("_____________Delete Success________________");
      update();
    } else {
      print("_____________Delete Failed: Item not found________________");
    }
  }

  double countTotal() {
    double totalMoney = 0.0;
    cartList.forEach((element) {
      totalMoney += (element.price) * element.qty;
    });
    return totalMoney;
  }
}

class Item_List extends StatefulWidget {
  Item_List({Key? key}) : super(key: key);

  @override
  State<Item_List> createState() => _Item_ListState();
}

class _Item_ListState extends State<Item_List> {
  final Item_Controller _cartcontroller = Get.put(Item_Controller());
  final FavController _controller = Get.put(FavController());
  @override
  void initState() {
    _cartcontroller.getCartList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Item_Controller>(
      init: _cartcontroller,
      builder: (controller) {
        return ListView.builder(
            shrinkWrap: true,
            itemCount: _cartcontroller.cartList.length,
            itemBuilder: (context, index) =>
                buildItem(_cartcontroller.cartList[index]));
      },
    );
  }

  Widget buildItem(FoodRepo foodRepo) {
    return GestureDetector(
      onTap: () {
        // _controller.decrease(); // or _controller.increase();
        // _controller.update();
        Get.to(() => DetailScreen(food: foodRepo));
      },
      child: GetBuilder<Item_Controller>(
        builder: (controller) {
          return Container(
            height: Get.height * 0.15,
            margin: EdgeInsets.all(Get.width * 0.03),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Get.width * 0.06),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade400,
                  spreadRadius: Get.width * 0.01,
                  blurRadius: Get.width * 0.01,
                  offset: Offset(0, Get.width * 0.005),
                ),
              ],
            ),
            child: Slidable(
              endActionPane: ActionPane(
                motion: BehindMotion(),
                children: [
                  SizedBox(
                    width: 5,
                  ),
                  SlidableAction(
                    onPressed: (context) {
                      _controller.saveFavItem(foodRepo);
                      print('Add Success');
                    },
                    backgroundColor: Colors.green,
                    icon: Icons.favorite_border_outlined,
                    autoClose: true,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  SlidableAction(
                    onPressed: (context) {
                      _cartcontroller.deleteFromCart(foodRepo);
                    },
                    backgroundColor: Colors.red,
                    icon: Icons.delete,
                    spacing: 12,
                    autoClose: true,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  top: 5,
                  right: 5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 70,
                      backgroundImage: AssetImage(foodRepo.image),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 150),
                          child: Text(
                            "${foodRepo.qty}\u00D7",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: Get.height * 0.025,
                            ),
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: foodRepo.subtitle,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: Get.height / 50,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.005,
                        ),
                        Text(
                          'Golden brown fried chicken',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.grey,
                            fontSize: Get.height / 80,
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.005,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '\$ ',
                                    style: TextStyle(
                                        fontSize: Get.height * 0.02,
                                        color: Colors.red),
                                  ),
                                  TextSpan(
                                    text: foodRepo.price.toString(),
                                    style: TextStyle(
                                        fontSize: Get.height * 0.03,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: Get.width * 0.1,
                            ),
                            Container(
                              child: RatingBar.builder(
                                initialRating: 3,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemSize: Get.height * 0.02,
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
