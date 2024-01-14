import 'package:flutter/material.dart';
import 'package:frontend/components/button.dart';
import 'package:frontend/models/restaurant.dart';
import 'package:frontend/pages/payment_page.dart';
import 'package:provider/provider.dart';

import '../components/my_cart_tile.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(builder: (context, restaurant, child) {
      //cart
      final userCart = restaurant.cart;
      return Scaffold(
        // backgroundColor: Theme.of(context).colorScheme.onBackground,
        primary: false,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.onBackground,
          title: Text("Cart "),
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title:
                                Text("Are you sure you want to clear the cart"),
                            actions: [
                              //cancel button
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text("Cancel"),
                              ),
                              //Yes button
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  restaurant.clearCart();
                                },
                                child: const Text("Yes"),
                              )
                            ],
                          ));
                },
                icon: const Icon(Icons.delete)),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Column(children: [
                Expanded(
                    child: ListView.builder(
                  itemCount: userCart.length,
                  itemBuilder: ((context, index) {
                    final cartItem = userCart[index];
                    return MyCart(
                      cartItem: cartItem,
                    );
                  }),
                ))
              ]),
            ),
            //Button to pay
            MyButton(
                text: "Go to Checkout",
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PaymentPage()))),
            const SizedBox(
              height: 25,
            )
          ],
        ),
      );
    });
  }
}
