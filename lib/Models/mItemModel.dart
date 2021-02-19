import 'package:flutter/material.dart';

class mItemModel {
  String name;
  String image;

  mItemModel(this.name, this.image);
}

List<mItemModel> items = itemData
    .map((item) => mItemModel(
      item['name'],
      item['image']))
    .toList();

var itemData = [
  {
    "name": "Dimsum",
    "image": "assets/images/dimsum.png",
  },
  {
    "name": "Pastry Cake",
    "image": "assets/images/cake.png",
  },
  {
    "name": "French Fries",
    "image": "assets/images/fries.png",
  },
  {
    "name": "Kopi Gula Aren",
    "image": "assets/images/coffee.png",
  },
  {
    "name": "Hazelnut Latte",
    "image": "assets/images/coffee.png",
  },
  {
    "name": "Caramel Latte",
    "image": "assets/images/coffee.png",
  }
];
