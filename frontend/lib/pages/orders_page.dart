import 'package:flutter/material.dart';

class Order_Page extends StatelessWidget {
  const Order_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      appBar: AppBar(
        title:const Text("Orders "),
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(10),
              color:Colors.white,
              child: Text(
                'Your order is successfully submitted',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),  // Adds space between the text and the icon
            Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 50,
            ),
          ],
        ),
    );
  }
}
