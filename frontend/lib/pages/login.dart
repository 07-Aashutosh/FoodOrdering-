import "package:flutter/material.dart";
import 'package:frontend/components/button.dart';
import 'package:frontend/components/defaultText.dart';
import "package:frontend/components/my_textfield.dart";
import 'package:frontend/models/auth_service.dart';
import 'package:frontend/models/flutter_secure_store.dart';

import 'homepage.dart';

// import "package:frontend/components/emailinput.dart";
class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const  LoginPage({super.key, this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  final _authService = AuthService();
  void _login() async {
    try {
      final response = await _authService.login(
        _usernameController.text, // fenching username form text 
        _passwordController.text,
      );
      print(response.containsKey("key"));
      if (response.containsKey("key")) {
        print("hello");
        print("token :" + response['key']);
        await UserSecureStorage.setToken(response['key']);
        print('Token: ${response['key']}');
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      } else {
        print("Login Failed");
      } // Handle the received token
    } catch (e) {
      print('Login error: $e');
      
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Login error: $e"),
        backgroundColor: Colors.red,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
           Image.asset(
              'lib/assets/logo/logo.jpg',
              width: 120,  // Adjust width as necessary
              height: 120, // Adjust height as necessary
            ),
            const SizedBox(height: 25), // gap mainted 
            //Text
            Text(
              "Welcome to Chiya Chautari! Please login to continue",
              style: TextStyle( 
                fontSize: 16,
                color: Theme.of(context).colorScheme.inverseSurface,
              ),
            ),
            //Email textfield
            const SizedBox(height: 25),
            MyTextField(
              inputController: _usernameController,
              hintText: "Enter your username",
              obscureText: false,
              // label:"Email"
            ),
            //password

            MyTextField(
              inputController: _passwordController,
              hintText: "Enter your password",
              obscureText: true,
              // label:"Password"
            ),
            //signin button
            const SizedBox(height: 25),
            MyButton(text: "Login", onTap: _login),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NormalText(text: "Not a member yet..!?"),
                const SizedBox(
                  width: 4,
                ),
                GestureDetector(
                    onTap: widget.onTap, child: BoldText(text: "Register Now"))
              ],
            )
          ]),
        ));
  }
}
