import 'dart:convert';
import 'package:http/http.dart' as http;
import 'food.dart';

class ApiService {
  static const String baseUrl = 'http://127.0.0.1:8000/api';

  static Future<List<Food>> fetchFoods() async {
    final response = await http.get(Uri.parse('$baseUrl/menuitems/'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      print(json.decode(response.body).toList());
      return jsonData.map((data) => Food.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load foods');
    }
  }

  static Future<List<FoodCategory>> fetchFoodCategories() async {
    final response = await http.get(Uri.parse('$baseUrl/category/'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((data) => FoodCategory.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load food categories');
    }
  }

  static Future<List<Addon>> fetchAddons() async {
    final response = await http.get(Uri.parse('$baseUrl/addon/'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((data) => Addon.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load addons');
    }
  }
}
