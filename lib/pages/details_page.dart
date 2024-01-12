// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class DetailsPage extends StatefulWidget {
  final String image;
  final String price;
  final String title;
  DetailsPage({
    required this.image,
    required this.price,
    required this.title,
    super.key,
  });

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int order = 1;
  bool isLoading = true;
  var _table = TextEditingController();

  sendOrder() async {
    final uri =
        Uri.parse('https://restorant-backend-i0ix.onrender.com/addorder');
    var response = await http.post(
      uri,
      body: {
        "title": widget.title,
        "price": widget.price,
        "amount": order.toString(),
        "table": _table.text
      },
    );
    print(response);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.green, size: 35, weight: 1000),
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              child: Image.asset(
                widget.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'Please enter order information',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Table No.',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.6,
                          height: 30,
                          child: TextField(
                            controller: _table,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.only(left: 25)),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OutlinedButton(
                          onPressed: () {
                            if (order > 1) {
                              setState(() {
                                order--;
                              });
                            }
                          },
                          child: Icon(Icons.remove),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 30),
                          child: Text('$order'),
                        ),
                        OutlinedButton(
                          onPressed: () {
                            setState(() {
                              order++;
                            });
                          },
                          child: Icon(Icons.add),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
              padding: EdgeInsets.all(16),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.1,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[300]),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Your order'),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Number of order : $order '),
                              Text('Name of order : ${widget.title}'),
                              Text('Price of order : ${widget.price}'),
                              Text('Table number : ${_table.text}'),
                            ],
                          ),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('cancel')),
                            TextButton(
                                onPressed: () async {
                                  // await Future.delayed(
                                  //   Duration(seconds: 3),
                                  // );
                                  sendOrder();
                                  await showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          content: Row(
                                            children: [
                                              FutureBuilder(
                                                future: myFuture(context),
                                                builder: (context, value) {
                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      isLoading
                                                          ? Row(
                                                              children: [
                                                                CircularProgressIndicator(),
                                                                SizedBox(
                                                                    width: 25),
                                                                Text(
                                                                    'Sending order...')
                                                              ],
                                                            )
                                                          : Text('')
                                                    ],
                                                  );
                                                },
                                              )
                                            ],
                                          ),
                                        );
                                      });
                                  Navigator.of(context).pop();
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text('Order recived'),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text('Ok'))
                                          ],
                                        );
                                      });
                                },
                                child: Text('Ok'))
                          ],
                        );
                      });
                },
                child: Text(
                  'Order',
                  style: GoogleFonts.cinzel(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ))
        ],
      ),
    );
  }
}

Future myFuture(context) async {
  await Future.delayed(Duration(seconds: 2), () {
    Navigator.of(context).pop();
  });
}

//  await Future.delayed(
//                                     Duration(seconds: 2),
//                                     () {
//                                       showDialog(
//                                           context: context,
//                                           builder: (context) {
//                                             return AlertDialog(
//                                               content:
//                                                   Text('Order successful!!!'),
//                                               actions: [
//                                                 TextButton(
//                                                     onPressed: () {
//                                                       Navigator.of(context)
//                                                           .pop();
//                                                     },
//                                                     child: Text('ok')),
//                                               ],
//                                             );
//                                           });
//                                       Navigator.of(context).pop();
//                                     },
//                                   );
