import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController inputController;
  final String hintText;
  final bool obscureText;
  const MyTextField(
      {super.key,
      required this.inputController,
      required this.hintText,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: inputController,
        obscureText: obscureText,
        style: TextStyle(color:Colors.white),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle:const TextStyle(color:Colors.white60),
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.primary),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.secondary),
          ),
        ),
      ),
    );
  }
}

// class MyTextField extends StatelessWidget {
//   final TextEditingController inputController;
//   final String hintText;
//   final bool obscureText;
//   final String label;
//   const MyTextField(
//       {Key? key,
//       required this.inputController,
//       required this.hintText,
//       required this.obscureText, required this.label})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     const primaryColor = Color(0xff4338CA);
//     const secondaryColor = Color(0xff6D28D9);
//     const accentColor = Color(0xffffffff);
//     const backgroundColor = Color(0xffffffff);
//     const errorColor = Color(0xffEF4444);

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
        
//         const SizedBox(
//           height: 8,
//         ),
//         Padding(
//           padding: const EdgeInsets.only(right:15,left:15),
//           child: Container(
//             height: 50,
           
//             decoration: BoxDecoration(boxShadow: [
//               BoxShadow(
//                   offset: const Offset(12, 26),
//                   blurRadius: 50,
//                   spreadRadius: 0,
//                   color: Colors.grey.withOpacity(.1)),
//             ]),
//             child: TextField(
//               controller: inputController,
//               onChanged: (value) {
//                 //Do something wi
//               },
//               keyboardType: TextInputType.emailAddress,
//               style: const TextStyle(fontSize: 14, color: Colors.black),
//               decoration: InputDecoration(
//                 label:  Text(label),
//                 labelStyle: const TextStyle(color: primaryColor),
//                 // prefixIcon: const Icon(Icons.email),
//                 filled: true,
//                 fillColor: accentColor,
//                 hintText: hintText,
//                 hintStyle: TextStyle(color: Colors.grey.withOpacity(.75)),
//                 contentPadding:
//                     const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
//                 border: const OutlineInputBorder(
//                   borderSide: BorderSide(color: primaryColor, width: 1.0),
//                   borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                 ),
//                 focusedBorder: const OutlineInputBorder(
//                   borderSide: BorderSide(color: secondaryColor, width: 1.0),
//                   borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                 ),
//                 errorBorder: const OutlineInputBorder(
//                   borderSide: BorderSide(color: errorColor, width: 1.0),
//                   borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                 ),
//                 enabledBorder: const OutlineInputBorder(
//                   borderSide: BorderSide(color: primaryColor, width: 1.0),
//                   borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
