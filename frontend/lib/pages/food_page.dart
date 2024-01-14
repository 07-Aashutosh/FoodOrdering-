import 'package:flutter/material.dart';
import 'package:frontend/components/button.dart';
import 'package:frontend/models/restaurant.dart';
import 'package:provider/provider.dart';

import '../models/food.dart';

class FoodPage extends StatefulWidget {
  final Food food;
  final Map<Addon, bool> selectedAddons = {};
  FoodPage({Key? key, required this.food}) : super(key: key) {
    for (Addon addon in food.availableAddons) {
      selectedAddons[addon] = false;
    }
  }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  void addToCart(Food food, Map<Addon, bool> selectedAddons) {
    Navigator.pop(context);

    List<Addon> currentSelectedAddons = [];
    for (Addon addon in widget.food.availableAddons) {
      if (widget.selectedAddons[addon] == true) {
        currentSelectedAddons.add(addon);
      }
    }
    context.read<Restaurant>().addToCart(food, currentSelectedAddons);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Column(children: [
          // Container(
          //  width: MediaQuery.of(context).size.width,
          //   height:MediaQuery.of(context).size.height/2.1,
          //   color: Colors.blue,
          //   child:
          Image.network(widget.food.imagePath,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.1,
              fit: BoxFit.cover),
          // ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.food.name,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                Text("Rs. ${widget.food.price}",
                    style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.primary)),
                const SizedBox(
                  height: 10,
                ),
                Text(widget.food.description),
                Divider(color: Theme.of(context).colorScheme.primary),
                const SizedBox(
                  height: 10,
                ),
                Text("Add-ons",
                    style: (TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.bold))),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).colorScheme.secondary)),
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: widget.food.availableAddons.length,
                      itemBuilder: (context, index) {
                        Addon addon = widget.food.availableAddons[index];
                        return CheckboxListTile(
                          value: widget.selectedAddons[addon],
                          title: Text(addon.name),
                          subtitle: Text("Rs. ${addon.price.toString()}"),
                          onChanged: (bool? value) {
                            setState(() {
                              widget.selectedAddons[addon] = value!;
                            });
                          },
                        );
                      }),
                )
              ],
            ),
          ),
          MyButton(text: "Add to Cart", onTap: ()=>addToCart(widget.food, widget.selectedAddons)),
          const SizedBox(height: 25,) 
        ]),
      ),
    );
  }
}
