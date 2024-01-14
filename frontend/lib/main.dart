import 'package:frontend/auth/login_or_register.dart';
import 'package:frontend/models/restaurant.dart';
import 'package:frontend/themes/theme_provider.dart';
import 'package:flutter/material.dart';
// import "package:flutter/cupertino.dart"
// import '/pages/login.dart';
import 'package:provider/provider.dart';

void main()  {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(
      create:(context)=>ThemeProvider(),
      
    ),
    ChangeNotifierProvider(
      create:(context)=>Restaurant(),
      
    ),
    ],child:const  MyApp(),)
    );
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      
      debugShowCheckedModeBanner: false,
      home: const LoginOrRegister(),
     
      theme:Provider.of<ThemeProvider>(context).themeData,
     
    );
  }
}
