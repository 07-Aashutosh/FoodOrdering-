import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.dark(
    background:const Color.fromARGB(255, 20, 20, 20),
    primary: const Color.fromRGBO(122, 122, 122, 1),
    secondary:const Color.fromARGB(255, 30, 30, 30),
    tertiary:const Color.fromARGB(255, 47, 47, 47),
    inversePrimary: Colors.grey.shade300,
    onBackground: const Color.fromARGB(255, 20, 20, 20),
    inverseSurface:   Colors.grey.shade300,
    onPrimary: const Color.fromARGB(255, 20, 20, 20),
  ),
);
