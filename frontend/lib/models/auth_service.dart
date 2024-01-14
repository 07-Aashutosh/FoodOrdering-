import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  final String baseUrl =
      'http://127.0.0.1:8000/auth/login/'; // Change this to your actual server IP/domain backend url
  final String registerUrl =
      'http://127.0.0.1:8000/auth/registration/'; // Change this to your actual server IP/domain backend url 

  Future<Map<String, dynamic>> login(String username, String password) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: <String, String>{
        'Content-Type':
            'application/json', // Important: Specifies the content type as JSON
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
        
      }),
    );

    print(response.statusCode); // Debugging: Print the status code

    if (response.statusCode == 200) {
      
      return json.decode(response.body);
    } else {
      print(response
          .body); // Debugging: Print response body if status code is not 200
      throw Exception('Failed to login. Status Code: ${response.statusCode} ${response.body}');
    }
  }

  Future<Map<String, dynamic>> register(
    String username,
    String email,
    String password,
    String ConfirmPassword,
  ) async {
    final response = await http.post(
      Uri.parse(registerUrl),
      headers: <String, String>{
        'Content-Type':
            'application/json', // Important: Specifies the content type as JSON
      },
      body: jsonEncode(<String, String>{
        "username": username,
        "email": email,
        "password1": password,
        "password2": ConfirmPassword
      }),
    );

    print(response.statusCode); // Debugging: Print the status code

    if (response.statusCode == 201) { //201 code for created
      return json.decode(response.body);
    } else {
       // Debugging: Print response body if status code is not 200
      throw Exception('Failed to register. Status Code: ${response.body}');
    }
  }
}
