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
              color: Colors.amber,
              child: Column(
                children: [
                  Text(data.qty.toString()),
                  //Text("DataData"),
                  //Text(),
                ],
              ),
            ),
          );
        },
      );
}
