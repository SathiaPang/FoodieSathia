import 'dart:convert';

// import 'package:flutter/material.dart';
import 'package:FoodieSathia/data/data.dart';
import 'package:FoodieSathia/model/historyModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductStorage {
  static ProductStorage get instance => ProductStorage._internal();
  ProductStorage._internal();

  Future<SharedPreferences> _getSharedPreferences() async =>
      await SharedPreferences.getInstance();

  Future<bool> putFoodDetail(FoodRepo foodRepo, String storeKey) async {
    final foodDetails = await getProductItems(storeKey);
    final isExist = foodDetails
        .indexWhere((element) => element.subtitle == foodRepo.subtitle);

    if (isExist == -1) {
      foodDetails.add(foodRepo);
      return putFoodDetails(foodDetails, storeKey);
    }

    return false;
  }

  Future<bool> putFoodDetails(
      List<FoodRepo> productDetails, String storeKey) async {
    final pref = await _getSharedPreferences();
    List<String> items =
        productDetails.map((e) => jsonEncode(e.toMap())).toList();
    return pref.setStringList(storeKey, items);
  }

  Future<List<FoodRepo>> getProductItems(String storeKey) async {
    final pref = await _getSharedPreferences();
    final items = pref.getStringList(storeKey);
    return items?.map((e) => FoodRepo.fromMap(jsonDecode(e))).toList() ?? [];
  }

  Future<bool> removeAllByKey({required String key}) async {
    final pref = await _getSharedPreferences();
    return pref.remove(key);
  }

  // history
  // Set 1 by 1
  Future<void> setDataHistory(HistoryModel history) async {
    final allfood = await getHistory();
    allfood.add(history);
    saveHistory(allfood);
  }

  // Save History
  Future<bool> saveHistory(List<HistoryModel> historyitem) async {
    final pref = await _getSharedPreferences();
    final List<String> tmplist =
        historyitem.map((e) => jsonEncode(e.toMap())).toList();
    return pref.setStringList("HistoryItem", tmplist);
  }

  // Get
  Future<List<HistoryModel>> getHistory() async {
    final pref = await _getSharedPreferences();
    List<String> rawlist = pref.getStringList("HistoryItem") ?? [];
    print(rawlist);
    return rawlist.map((e) => HistoryModel.fromJson(jsonDecode(e))).toList();
  }

  // Future<List<HistoryOrder>> getAllHistoryOrders() async {
  //   final pref = await _getSharedPreferences();
  //   final items = pref.getStringList(history_key);
  //   debugPrint(items.toString());
  //   return items?.map((e) => HistoryOrder.fromMap(jsonDecode(e))).toList() ?? [];
  // }

  // Future<bool> putHistoryOrders(List<HistoryOrder> historyOrders) async {
  //   final pref = await _getSharedPreferences();
  //   List<String> items = historyOrders.map((e) => jsonEncode(e.toMap())).toList();
  //   return pref.setStringList(history_key, items);
  // }

  // Future<bool> putHistory(HistoryOrder order) async {
  //   final historyOrders = await getAllHistoryOrders();
  //   historyOrders.add(order);
  //   return putHistoryOrders(historyOrders);
  // }
}
