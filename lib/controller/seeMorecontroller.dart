// import 'dart:async';
import 'package:get/get.dart';

import '../data/data.dart';

class SeemoreController extends GetxController {
  // Timer? _debounce;

  // get foodrepo => null;
  // @override
  // void onReady() {
  //   super.onReady();
  //   searchByTitle("");
  // }

  // @override
  // void dispose() {
  //   _debounce?.cancel();
  //   super.dispose();
  // }

  // final serachResult = <FoodRepo>[].obs;

  // void searchByTitle(String query) {
  //   if (_debounce?.isActive ?? false) _debounce?.cancel();
  //   _debounce = Timer(const Duration(milliseconds: 400), () {
  //     serachResult.value = foodrepo
  //         .expand((element) => element.productDetile)
  //         .where((element) =>
  //             element.title!.toLowerCase().contains(query.toLowerCase()))
  //         .toList();
  //   });
  // }

  RxList<FoodRepo> serachResult = <FoodRepo>[].obs;

  void SearchResults(String Query) {
    serachResult.clear();

    FoodRepo.foodrepo.forEach((element) {
      if (element.subtitle.toLowerCase().contains(Query.toLowerCase())) {
        serachResult.add(element);
      }
      ;
    });
  }
}
