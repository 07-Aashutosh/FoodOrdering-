import 'package:flutter/material.dart';
import '../models/food.dart';

class MyTabBar extends StatelessWidget {
  final TabController tabController;
  final List<FoodCategory> foodCategories;

  const MyTabBar({Key? key, required this.tabController, required this.foodCategories})
      : super(key: key);

  List<Tab> _buildCategoryTabs() {
    return foodCategories.map((category) {
      return Tab(
        text: category.name,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabBar(
        controller: tabController,
        indicatorColor: Theme.of(context).colorScheme.inversePrimary,
        tabs: _buildCategoryTabs(),
      ),
    );
  }
}
