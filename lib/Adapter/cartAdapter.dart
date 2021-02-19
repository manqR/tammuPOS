import 'package:flutter/material.dart';


class cartAdapter {
  String qty;
  String itemCode;
  String totalPrice;
  String itemName;
  String itemVariant;

  cartAdapter(this.qty, this.itemCode, this.totalPrice, this.itemName, this.itemVariant);
}

List<cartAdapter> carts = cartData
    .map((item) => cartAdapter(
    item['qty'],
    item['itemCode'],
    item['totalPrice'],
    item['itemName'],
    item['itemVariant']))
    .toList();

var cartData = [
  {
    "qty": "3",
    "itemCode": "C0001",
    "totalPrice": "15.000",
    "itemName": "Kopi Aren",
    "itemVariant": "Less Sugar",
  },
  {
    "qty": "1",
    "itemCode": "F0001",
    "totalPrice": "12.000",
    "itemName": "French Fries",
    "itemVariant": "Regular",
  },
];
