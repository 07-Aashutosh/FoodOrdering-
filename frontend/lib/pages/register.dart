import 'package:flutter/material.dart';
import 'package:frontend/models/auth_service.dart';
import 'package:frontend/pages/login.dart';

import '../components/button.dart';
import '../components/defaultText.dart';
import '../components/my_textfield.dart';

class RegisterPage extends StatefulWidget {
    final void Function()? onTap;
  const RegisterPage({Key? key, this.onTap}) : super(key: key);
  

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final AuthService authService = AuthService();

  void _register() async {
    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Passwords do not match"),
        backgroundColor: Colors.red,
      ));
      return; // Stop the function if the passwords do not match
    }

    try {
      final response = await authService.register(
        usernameController.text,
        emailController.text,
        passwordController.text,
        confirmPasswordController.text,
      );

      if (response.containsKey('key')) {
        print('Registration successful: Token: ${response['key']}');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("You are registerd successfully!!"),
          backgroundColor: Colors.green,
        ));
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      } else {
        String errorMessage = parseErrors(response);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(errorMessage),
          backgroundColor: Colors.red,
        ));
      }
    } catch (e) {
      print('Registration error: $e');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Registration error: $e"),
        backgroundColor: Colors.red,
      ));
    }
  }

  String parseErrors(Map<String, dynamic> response) { // show all errors 
    return response.entries.map((entry) {
      return '${entry.key}: ${entry.value.join(', ')}';
    }).join('\n');
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
          const SizedBox(height: 25),
          Text("Welcome to Chiya Chautari! Please register to continue",
              style: TextStyle(fontSize: 16, color: Theme.of(context).colorScheme.inversePrimary)),
          const SizedBox(height: 25),
          MyTextField(inputController: usernameController, hintText: "Enter your username", obscureText: false),
          MyTextField(inputController: emailController, hintText: "Enter your email", obscureText: false),
          MyTextField(inputController: passwordController, hintText: "Enter your password", obscureText: true),
          MyTextField(inputController: confirmPasswordController, hintText: "Confirm your password", obscureText: true),
          const SizedBox(height: 25),
          MyButton(text: "Register", onTap: _register),
          const SizedBox(height: 25),
        Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NormalText(text: "Already  a member yet..!?"),
                const SizedBox(
                  width: 5,
                ),
                GestureDetector(
                    onTap: widget.onTap, child: BoldText(text: "Login  Now"))
              ],
            ),
        ]),
      ),
    );
  }
}
