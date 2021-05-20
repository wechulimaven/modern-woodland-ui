import 'package:flutter/material.dart';

class Item {
  int id;
  String name;
  String imagePath;
  int discountPercent;
  double originalPrice;
  double rating;
  String description;
  Map<String, List<String>> differentImageUrl;

  Item(
      {@required id,
        @required this.name,
      @required this.imagePath,
      @required this.originalPrice,
      @required this.rating,
      this.discountPercent,
      this.differentImageUrl,
      this.description});

  double get price {
    return discountPercent != null
        ? (originalPrice - (originalPrice * discountPercent / 100))
        : originalPrice;
  }

  static String format(double price) {
    String money = price.toStringAsFixed(2);
    return '\$$money';
  }
}
