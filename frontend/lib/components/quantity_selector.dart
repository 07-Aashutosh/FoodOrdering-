import 'package:flutter/material.dart';

import '../models/food.dart';

class QuantitySelector extends StatelessWidget {
  final int quantity;
  final Food food;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const QuantitySelector(
      {Key? key,
      required this.quantity,
      required this.food,
      required this.onDecrement,
      required this.onIncrement})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(50),
      ),
      padding: const EdgeInsets.all(8),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        GestureDetector(
          onTap: onDecrement,
          child:Icon(Icons.remove ,
          color:Theme.of(context).colorScheme.primary,
          size:20)
        ),
        //quantity count
        Padding(padding: EdgeInsets.symmetric(horizontal: 8),
        child:Center(child: Text(
          quantity.toString(),
        )
        )
        ,),
        //Increment
         GestureDetector(
          onTap: onIncrement,
          child:Icon(Icons.add ,
          color:Theme.of(context).colorScheme.primary,
          size:20)
        ),
      ]),
    );
  }
}
