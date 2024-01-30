import 'package:FoodieSathia/constant/constants.dart';
import 'package:FoodieSathia/controller/history_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final AddToHistoryController _controller = Get.find();

  @override
  void initState() {
    _controller.getAllHistory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('History Page'),
          centerTitle: true,
        ),
        //body: _buildCart(),
        body: Obx(() => _buildCart()));
  }

  Widget _buildCart() => ListView.builder(
        itemCount: _controller.foodlist.length,
        //itemCount: 10,
        itemBuilder: (context, index) {
          final data = _controller.foodlist[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.history,
                        size: 90,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Qty: ${data.qty.toString()}',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            'Total: ${data.total.toString()}',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text("DataTime: ${data.orderDate}"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
}
