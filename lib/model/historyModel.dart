import 'package:FoodieSathia/data/data.dart';

import 'package:intl/intl.dart';

class HistoryModel {
  final int qty;
  final List<FoodRepo> items;
  final String orderDate;
  final double total;

  HistoryModel({
    required this.total,
    required this.qty,
    required this.items,
    required this.orderDate,
  });

  factory HistoryModel.fromJson(Map<String, dynamic> json) {
    List<FoodRepo>? details;

    if (json['items'] != null) {
      details = (json['items'] as List)
          .map((e) => FoodRepo.fromMap(e as Map<String, dynamic>))
          .toList();
    }

    return HistoryModel(
      orderDate: json["orderDate"] ?? "",
      qty: json['qty'] ?? 0,
      items: details ?? [],
      total: json['total'] ?? 0,
    );
  }
  Map<String, dynamic> toMap() {
    return {
      "orderDate": orderDate,
      "qty": qty,
      "items": items.map((e) => e.toMap()).toList(),
      "total": total,
    };
  }

  String formatDate() =>
      DateFormat("yyyy/MMM/dd hh:mm a").format(DateTime.parse(orderDate));

  String formatDate1() => DateFormat("yyyymmmdd").format(
        DateTime.parse(orderDate),
      );

  int getItemsCount() {
    var totalQty = 0;
    items.forEach((element) {
      totalQty += element.qty;
    });
    print('------->>${totalQty}');
    return totalQty;
  }
}
