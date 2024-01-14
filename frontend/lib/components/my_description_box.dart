import 'package:flutter/material.dart';

class MyDescriptionBox extends StatelessWidget {
  const MyDescriptionBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myPrimaryTextStyle =
        TextStyle(color: Theme.of(context).colorScheme.inversePrimary);
         var mysecondaryTextStyle =
        TextStyle(color: Theme.of(context).colorScheme.primary); 
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.secondary),
        ),
        margin: const EdgeInsets.only(left:25,right:25,bottom:25),
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(children: [
                Text("30 min",style:myPrimaryTextStyle),
                Text("Food Preparation Time ",style: mysecondaryTextStyle,),
              ]),
            ],
          ),
        ));
  }
}
