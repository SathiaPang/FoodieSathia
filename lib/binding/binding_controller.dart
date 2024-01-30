import 'package:FoodieSathia/controller/history_controller.dart';
import 'package:get/get.dart';

class ControllerBnding extends Bindings {
  @override
  void dependencies() {
    Get.put(AddToHistoryController());
  }
}
