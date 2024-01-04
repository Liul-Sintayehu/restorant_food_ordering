import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodComponent extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  const FoodComponent(
      {super.key,
      required this.image,
      required this.title,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(image),
          )),
          Text(title),
          Text(price),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green[300]),
                    onPressed: () {},
                    child: Text(
                      'Order',
                      style: GoogleFonts.cinzel(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
