import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:restorant_food_ordering/components/food_component.dart';
import 'package:restorant_food_ordering/provider/foods_provider.dart';

import '../components/category_component.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List categories = [
    [0, 'image1', 'title'],
    [1, 'image2', 'title'],
    [2, 'image3', 'title']
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Restorant Food Ordering App',
          style: GoogleFonts.cinzel(fontSize: 20),
        ),
        leading: Builder(builder: (context) {
          return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(
                Icons.menu_outlined,
              ));
        }),
      ),
      drawer: Drawer(),
      body: Consumer<FoodProvider>(
        builder: (context, value, child) {
          return Container(
            margin: EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Catagories',
                  style: GoogleFonts.cinzel(fontSize: 20),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return CategoryComponent(
                          isSelected: selectedIndex == index,
                          image: categories[index][1],
                          title: categories[index][2],
                          onPressed: () {
                            setState(() {
                              selectedIndex = categories[index][0];
                            });
                          },
                        );
                      }),
                ),
                (selectedIndex == 0)
                    ? yetsomMethod(value)
                    : (selectedIndex == 1)
                        ? yefskMethod(value)
                        : metetMethod(value)
              ],
            ),
          );
        },
      ),
    );
  }

  Expanded yetsomMethod(FoodProvider value) {
    return Expanded(
      child: GridView.builder(
          itemCount: value.getFoods[0].length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1 / 1.2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemBuilder: (context, index) {
            return FoodComponent(
                image: value.getFoods[0][index].image,
                title: value.getFoods[0][index].title,
                price: value.getFoods[0][index].price);
          }),
    );
  }

  Expanded yefskMethod(FoodProvider value) {
    return Expanded(
      child: GridView.builder(
          itemCount: value.getFoods[1].length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1 / 1.2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemBuilder: (context, index) {
            return FoodComponent(
                image: value.getFoods[1][index].image,
                title: value.getFoods[1][index].title,
                price: value.getFoods[1][index].price);
          }),
    );
  }

  Expanded metetMethod(FoodProvider value) {
    return Expanded(
      child: GridView.builder(
          itemCount: value.getFoods[0].length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1 / 1.2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemBuilder: (context, index) {
            return FoodComponent(
                image: value.getFoods[2][index].image,
                title: value.getFoods[2][index].title,
                price: value.getFoods[2][index].price);
          }),
    );
  }
}
