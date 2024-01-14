import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:frontend/models/cart_item.dart';
import 'api_service.dart';
import 'food.dart';

class Restaurant extends ChangeNotifier {
  List<Food> _menu = [];
  List<FoodCategory> _categories = [];

  List<Food> get menu => _menu;
  List<FoodCategory> get categories => _categories;

  Restaurant() {
    fetchMenu();
    fetchCategories();
  }

  void fetchMenu() async {
    try {
      List<Food> fetchedMenu = await ApiService.fetchFoods();
      print('hello');
      _menu = fetchedMenu;
      notifyListeners();
    } catch (e) {
      print('Error fetching menu: $e');
    }
  }

  void fetchCategories() async {
    try {
      List<FoodCategory> fetchedCategories =
          await ApiService.fetchFoodCategories();
      _categories = fetchedCategories;
      notifyListeners();
    } catch (e) {
      print('Error fetching categories: $e');
    }
  }
  // Rest of your Restaurant class methods...

  //  GETTERS

  //-- OPERATIONS--//
  List<CartItem> get cart => _cart;
  //user cart
  List<CartItem> _cart = [];
  //add to cart
  void addToCart(Food food, List<Addon> selectedAddons) {
    //see if there is a cart item already with the same food and selected addons
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      //check if food item are the same
      bool isSameFood = item.food == food;
      //check is sameAddons
      bool isSameAddons =
          ListEquality().equals(item.selectedAddons, selectedAddons);
      return isSameAddons && isSameFood;
    });
    if (cartItem != null) {
      cartItem.quantity++;
    }
    //otherwise  add a new cart item
    else {
      _cart.add(CartItem(food: food, selectedAddons: selectedAddons));
    }
    notifyListeners();
  }

  //remove to cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);
    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
      notifyListeners();
    }
    notifyListeners();
  }

  //get total price of cart
  double getTotalPrice() {
    double total = 0.0;
    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;
      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }
      total += itemTotal * cartItem.quantity;
    }
    return total;
  }

  //get total number of items in cart
  int getTotalItemCount() {
    int totalItemCount = 0;
    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

  //clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }
  // ---operations end --//

/*
 H E L P E RS
*/

//generate a receipt

  //format double value into money

  //format list of addons into a string summery

}
