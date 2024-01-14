import "package:flutter/material.dart";
import 'package:frontend/components/quantity_selector.dart';
import 'package:frontend/models/cart_item.dart';
import 'package:provider/provider.dart';
import '../models/restaurant.dart';

class MyCart extends StatelessWidget {
  final CartItem cartItem;
  const MyCart({Key? key, required this.cartItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) => Container(
        decoration:BoxDecoration(
          color:Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 25,vertical:10),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                //food image
                Image.network(
                  cartItem.food.imagePath,
                  height: 100,
                  width: 100,
                ),
                const SizedBox(width:10),
                //name and price
                Column(
                  children: [
                    Text(cartItem.food.name),
                    Text("Rs. ${cartItem.food.price.toString()}")
                  ],
                ),
                const Spacer(),
                //increment and decrement
                QuantitySelector(
                    quantity: cartItem.quantity,
                    food: cartItem.food,
                    onDecrement: () {
                      restaurant.removeFromCart(cartItem);
                    },
                    onIncrement: () => restaurant.addToCart(
                        cartItem.food, cartItem.selectedAddons))
              ],
            ),
          ),
          //addons
          SizedBox(
            height: cartItem.selectedAddons.isEmpty?0:60,
            child:ListView(
              scrollDirection: Axis.horizontal,
              padding:EdgeInsets.only(left:10,bottom:10,right: 10),
              children: cartItem.selectedAddons.map(
                (addon)=>Padding(
                  padding: const EdgeInsets.only(right:8.0),
                  child: FilterChip(label: Row(
                    children: [
                      Text(addon.name),
                      Text('( Rs.${addon.price})',style: TextStyle(color:Theme.of(context).colorScheme.primary),),

                    ],
                  ),
                  shape: StadiumBorder(
                    side: BorderSide(color:Theme.of(context).colorScheme.primary),
                  ),
                  onSelected: (value){},
                    backgroundColor:
                    Theme.of(context).colorScheme.secondary,
                    labelStyle:TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    fontSize: 12),
                  
                  ),
                )
              ).toList(),
            )
          )
        ]),
      ),
    );
  }
}
