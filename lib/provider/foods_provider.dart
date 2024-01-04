import 'package:flutter/material.dart';

class FoodProvider extends ChangeNotifier {
  final List foods = [
    [
      Food('foods/yetsom/b1.jpg', '12', 'doro'),
      Food('foods/yetsom/b1.jpg', '12', 'doro'),
      Food('foods/yetsom/b1.jpg', '12', 'doro'),
      Food('foods/yetsom/b1.jpg', '12', 'doro'),
    ],
    [
      Food('foods/yetsom/b1.jpg', '12', 'aynet'),
      Food('foods/yetsom/b1.jpg', '12', 'aynet'),
      Food('foods/yetsom/b1.jpg', '12', 'aynet'),
      Food('foods/yetsom/b1.jpg', '12', 'aynet'),
    ],
    [
      Food('foods/yetsom/b1.jpg', '12', 'mango'),
      Food('foods/yetsom/b1.jpg', '12', 'avocado'),
      Food('foods/yetsom/b1.jpg', '12', 'lemon'),
      Food('foods/yetsom/b1.jpg', '12', 'lemon'),
    ],
  ];

  get getFoods => foods;
}

class Food {
  final String title;
  final String price;
  final String image;
  Food(this.image, this.price, this.title);
}
