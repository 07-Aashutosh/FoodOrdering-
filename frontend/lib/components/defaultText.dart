import 'package:flutter/material.dart';

class NormalText extends StatelessWidget {
  final String text;
   NormalText({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 16, color: Theme.of(context).colorScheme.inverseSurface),
    );
  }
}
class BoldText extends StatelessWidget {
  final String text;
  BoldText({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 16, color: Theme.of(context).colorScheme.inverseSurface,
          fontWeight: FontWeight.bold),
    );
  }
}
