import 'package:flutter/material.dart';

class FoodProvider extends ChangeNotifier {
  final List foods = [
    [
      Food('foods/yetsom/b1.jpg', '150', 'በያይነት'),
      Food('foods/yetsom/pasta.jpg', '160', 'ፓስታ'),
      Food('foods/yetsom/ruz.jpg', '160', 'ሩዝ'),
      Food('foods/yetsom/shro.jpg', '140', 'ሽሮ'),
    ],
    [
      Food('foods/yefsg/doro.jpg', '500', 'ዶሮ'),
      Food('foods/yefsg/kkl.jpg', '450', 'ቅቅል'),
      Food('foods/yefsg/ktfo.jpg', '500', 'ክትፎ'),
      Food('foods/yefsg/tbs.jpg', '450', 'ጥብስ'),
    ],
    [
      Food('foods/metet/bira2.jpg', '50', 'ቢራ'),
      Food('foods/metet/wine.jpg', '120', 'ወይን'),
      Food('foods/metet/wski.jpg', '1750', 'ውስኪ'),
      Food('foods/metet/draft.jpg', '35', 'ድራፍት'),
    ],
    [
      Food('foods/cake/chocolate.jpg', '200', 'ቸኮሌት'),
      Food('foods/cake/soft.jpg', '150', 'ሶፍት'),
      Food('foods/cake/torta.jpg', '1000', 'ቶርታ'),
      Food('foods/cake/birthday.jpg', '750', 'የልደት'),
    ],
    [
      Food('foods/tkus/buna.jpg', '50', 'ቡና'),
      Food('foods/tkus/shay.jpg', '40', 'ሻይ'),
      Food('foods/tkus/wetet.jpg', '60', 'ወተት'),
      Food('foods/tkus/makiato.jpg', '65', 'ማኪያቶ'),
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
