import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  
  colorScheme: ColorScheme.light(
    background: Colors.grey.shade300,//Color.fromARGB(255, 189,59,0)
    primary: Colors.grey.shade500,
    secondary: Colors.grey.shade100,
    tertiary: Colors.white,
    onBackground: Color.fromARGB(255, 124, 42, 5),
    inversePrimary: Colors.grey.shade700,
    inverseSurface: Colors.white70,
    onPrimary: Color.fromARGB(255,177,143,106)
  ),
  appBarTheme: AppBarTheme(
    foregroundColor:Colors.grey.shade700,
      backgroundColor: Colors.transparent, // Make app bar transparent
      iconTheme: IconThemeData(color: Colors.white60), // Set icon color
      titleTextStyle: TextStyle(color: Color.fromARGB(200, 255, 255, 255) ,fontSize: 21,), // Set title text color
    ),
);
