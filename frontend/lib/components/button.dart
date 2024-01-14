import "package:flutter/material.dart";

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  const MyButton({Key? key, required this.text, required this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child:Padding(
        padding: const EdgeInsets.only(right:100 ,left:100),
        
        child: Container( 
          padding:const EdgeInsets.all(25),
          
          decoration: BoxDecoration(
            color:Theme.of(context).colorScheme.primary,

            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Center(
            child: Text(
              text,
              style:TextStyle(fontWeight:FontWeight.bold,
              color: Theme.of(context).colorScheme.secondary,
              fontSize:16))

              ),
        ),
      )
    );
  }
}
