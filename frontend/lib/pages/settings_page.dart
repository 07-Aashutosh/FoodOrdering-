import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:frontend/components/defaultText.dart';
import 'package:frontend/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: Column(children: [
        Container(
          decoration:
              BoxDecoration(color: Theme.of(context).colorScheme.secondary),
          margin: EdgeInsets.only(left: 50, right: 50, top: 50),
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BoldText(text: "Dark Mode"),
              CupertinoSwitch(
                value: Provider.of<ThemeProvider>(context, listen: false)
                    .isDarkMode,
                onChanged: (value) =>
                    Provider.of<ThemeProvider>(context, listen: false)
                        .toggleTheme(),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
