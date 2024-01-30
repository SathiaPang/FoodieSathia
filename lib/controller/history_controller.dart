import 'package:FoodieSathia/data/data.dart';
import 'package:FoodieSathia/model/historyModel.dart';
import 'package:FoodieSathia/repositary/repo_controller.dart';
import 'package:get/get.dart';

class AddToHistoryController extends GetxController {
  final ProductStorage _productStorage = ProductStorage.instance;
  final foodlist = <HistoryModel>[].obs;

  void getAllHistory() async {
    final getHistoryItems = await _productStorage.getHistory();
    print("Get=====${getHistoryItems}");
    foodlist(getHistoryItems);
  }

  void SaveHistoryData(List<FoodRepo> foods) async {
    var totalamount = 0.0;
    foods.forEach((e) => totalamount += double.parse("${e.price}") * e.qty);
    final history = HistoryModel(
        qty: foods.length,
        items: List.from(foods),
        orderDate: DateTime.now().toString(),
        total: totalamount
        );

    await _productStorage.setDataHistory(history);
    getAllHistory();
  }
}
