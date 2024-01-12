// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:restorant_food_ordering/components/food_component.dart';
import 'package:restorant_food_ordering/pages/details_page.dart';
import 'package:restorant_food_ordering/pages/wiater_page.dart';
import 'package:restorant_food_ordering/provider/foods_provider.dart';

import '../components/category_component.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List categories = [
    [0, 'image1', 'የፆም'],
    [1, 'image2', 'የፍስክ'],
    [2, 'image3', 'መጠጥ'],
    [3, 'image3', 'ኬክ'],
    [4, 'image3', 'ትኩስ'],
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Food Ordering App',
          style: GoogleFonts.cinzel(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(
                Icons.menu_outlined,
              ),
            );
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => WaiterPage()));
            },
            icon: Icon(Icons.person),
          ),
        ],
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 245, 242, 242),
                          borderRadius: BorderRadius.circular(15)),
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
                  ),
                ),
                (selectedIndex == 0)
                    ? yetsomMethod(value)
                    : (selectedIndex == 1)
                        ? yefskMethod(value)
                        : (selectedIndex == 2)
                            ? metetMethod(value)
                            : (selectedIndex == 3)
                                ? metetMethod(value)
                                : yefskMethod(value)
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
              price: value.getFoods[0][index].price,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DetailsPage(
                    image: value.getFoods[0][index].image,
                    price: value.getFoods[0][index].price,
                    title: value.getFoods[0][index].title,
                  ),
                ));
              },
            );
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
              price: value.getFoods[1][index].price,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DetailsPage(
                    image: value.getFoods[1][index].image,
                    price: value.getFoods[1][index].price,
                    title: value.getFoods[1][index].title,
                  ),
                ));
              },
            );
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
              price: value.getFoods[2][index].price,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DetailsPage(
                    image: value.getFoods[2][index].image,
                    price: value.getFoods[2][index].price,
                    title: value.getFoods[2][index].title,
                  ),
                ));
              },
            );
          }),
    );
  }
}
