import 'package:flutter/material.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: false,
      appBar: AppBar(
        title: Text("Profile Page"),
        backgroundColor:Theme.of(context).colorScheme.onBackground,
      ),
    );
  }
}