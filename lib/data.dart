import 'package:flutter/material.dart';
import 'package:pizzaflutterapp/fooditem.dart';

List<FoodItems> getFoodData() {
  List<FoodItems> foodItemList = List<FoodItems>();
  FoodItems foodItem = FoodItems();
  String pizzaDescription =
      'Pizza (Italian: [ˈpittsa], Neapolitan: [ˈpittsə]) is a savory dish of Italian origin, consisting of a usually round,'
      ' flattened base of leavened wheat-based dough topped with tomatoes, cheese, and often various other ingredients'
      ' (anchovies, olives, meat, etc.) baked at a high temperature, traditionally in a wood-fired oven.'
      '[1] A small pizza is sometimes called a pizzetta.';

  foodItem = FoodItems.data(1, "assets/pizza_1.png", "Veg Pizza", "Pizza",
      "\$100", pizzaDescription, false, Colors.brown, 1);
  foodItemList.add(foodItem);

  foodItem = FoodItems.data(2, "assets/pizza_2.png", "Farmhouse Pizza", "Pizza",
      "\$100", pizzaDescription, false, Colors.amber, 2);
  foodItemList.add(foodItem);

  foodItem = FoodItems.data(3, "assets/pizza_3.png", "Veggie Loaded Pizza",
      "Pizza", pizzaDescription, "\$100", false, Colors.redAccent, 4);
  foodItemList.add(foodItem);

  foodItem = FoodItems.data(4, "assets/pizza_4.png", "CornHouse Pizza", "Pizza",
      "\$100", pizzaDescription, false, Colors.green, 5);
  foodItemList.add(foodItem);

  foodItem = FoodItems.data(5, "assets/pizza_5.png", "Margreta Pizza", "Pizza",
      "\$100", pizzaDescription, false, Colors.pinkAccent, 4);
  foodItemList.add(foodItem);

  return foodItemList;
}
