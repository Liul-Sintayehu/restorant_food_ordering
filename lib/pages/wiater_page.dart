// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WaiterPage extends StatelessWidget {
  WaiterPage({super.key});

  var table = TextEditingController();
  var reason = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Table No.',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: 30,
                  child: TextField(
                    controller: table,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.only(left: 25)),
                  ),
                )
              ],
            ),

            SizedBox(height: 20),
            //reason

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'reason',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: 30,
                  child: TextField(
                    controller: reason,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.only(left: 25)),
                  ),
                )
              ],
            ),

            //

            SizedBox(height: 50),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(26),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[300]),
                onPressed: () async {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Waiters are comming!!'),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [],
                          ),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Ok'))
                          ],
                        );
                      });

                  final uri = Uri.parse(
                      'https://restorant-backend-i0ix.onrender.com/requestwaiter');
                  await http.post(uri,
                      body: {"table": table.text, "reason": reason.text});
                },
                child: Text(
                  'Call a Waiter',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
