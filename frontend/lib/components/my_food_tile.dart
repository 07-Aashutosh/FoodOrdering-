import 'package:flutter/material.dart';

import '../models/food.dart';

class FoodTile extends StatelessWidget {
  const FoodTile({Key? key, required this.food,required this.onTap}) : super(key: key);
  final Food food;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child:Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [

              Expanded(child: 
              Column(
                
                crossAxisAlignment: CrossAxisAlignment.start, 
                children: [
                //food details,price &description
                Text(food.name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                Text("Rs. ${food.price}",style: TextStyle(fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.primary)),
                Text(food.description.length > 70
            ? '${food.description.substring(0, 70)}...'
            : food.description,),
              ],)
              ),
              //Food image
              const SizedBox(width:15),
              ClipRRect(
                borderRadius:BorderRadius.circular(8),
                child: Image.network(food.imagePath,height: 120,)),
            ],
            
            ),
          )
        ),
        const Divider()
      ],
    );
  }
}
