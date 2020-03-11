import 'package:flutter/cupertino.dart';

class FoodItems {
  int itemId;
  String foodImage;
  String foodTitle;
  String foodCategory;
  String foodPrice;
  String foodDescription;
  bool isFavorite;
  Color backgroundColor;
  int rating;

  FoodItems();

  FoodItems.data(
      this.itemId,
      this.foodImage,
      this.foodTitle,
      this.foodCategory,
      this.foodPrice,
      this.foodDescription,
      this.isFavorite,
      this.backgroundColor,
      this.rating);
}
