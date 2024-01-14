import 'package:flutter/material.dart';
import 'api_service.dart';

class Food {
  final int id;
  final String name;
  final String description;
  final String imagePath;
  final double price;
  final FoodCategory category;
  List<Addon>  availableAddons ;
  final bool availability;

  Food(
      {required this.id,
      required this.name,
      required this.description,
      required this.imagePath,
      required this.price,
      required this.category,
      required this.availableAddons,
      required this.availability});

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      imagePath: json['image'],
      price: json['price'] != null ? double.tryParse(json['price'].toString()) ?? 0.0 : 0.0,
      category: FoodCategory.fromJson(json['category']),
      availability: json['availability'],
      // availableAddons:
      //     List<Addon>.from(json['addons'].map((x) => Addon.fromJson(x))),
      availableAddons:
          (json['addons'] as List).map((x) => Addon.fromJson(x) ).toList() ,
    );
  }
}

class FoodCategory {
  final int id;
  final String name;

  FoodCategory({required this.id, required this.name});

  factory FoodCategory.fromJson(Map<String, dynamic> json) {
    return FoodCategory(
      id: json['id'],
      name: json['name'],
    );
  }
}

class Addon {
  final int id;
  final String name;
  final double price;

  Addon({required this.name, required this.price,required this.id});

  factory Addon.fromJson(Map<String, dynamic> json) {
    return Addon(
      id: json['id'],
      name: json['name'],
      price: json['price'] != null ? double.tryParse(json['price'].toString()) ?? 0.0 : 0.0,
    );
  }
}
