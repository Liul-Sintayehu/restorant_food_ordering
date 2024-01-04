import 'package:flutter/material.dart';

class CategoryComponent extends StatelessWidget {
  final String image;
  final String title;
  final bool isSelected;
  final Function() onPressed;
  const CategoryComponent(
      {super.key,
      required this.image,
      required this.title,
      required this.onPressed,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: size.height * 0.1,
        width: size.height * 0.1,
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(),
            color: isSelected ? Colors.orange[100] : Colors.transparent),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.food_bank),
            Text(title),
          ],
        ),
      ),
    );
  }
}
