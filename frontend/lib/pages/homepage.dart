import 'package:flutter/material.dart';
import 'package:frontend/components/my_current_location.dart';
import 'package:frontend/components/my_drawer.dart';
import 'package:frontend/components/my_food_tile.dart';
import 'package:frontend/components/my_sliver_app_bar.dart';
import 'package:frontend/components/my_tab_bar.dart';
import 'package:frontend/models/food.dart';
import 'package:frontend/models/restaurant.dart';
import 'package:provider/provider.dart';

import '../components/my_description_box.dart';
import 'food_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final restaurant = Provider.of<Restaurant>(context);
    // Ensure we dispose of the old controller if it exists
    _tabController?.dispose();
    if (restaurant.categories.isNotEmpty) {
      _tabController = TabController(length: restaurant.categories.length, vsync: this);
    }
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  List<Widget> buildCategoryTabs(List<FoodCategory> categories, List<Food> fullMenu) {
    return categories.map((category) {
      List<Food> categoryMenu = fullMenu.where((food) => food.category.id == category.id).toList();
      return ListView.builder(
        itemCount: categoryMenu.length,
        itemBuilder: (context, index) {
          final food = categoryMenu[index];
          return FoodTile(
            food: food,
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => FoodPage(food: food))),
          );
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    Restaurant restaurant = Provider.of<Restaurant>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      drawer: MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySliverAppBar(
            title: _tabController != null ? MyTabBar(
              tabController: _tabController!,
              foodCategories: restaurant.categories,
            ) : Container(), // Fallback for no categories
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                
                // const MyCurrentLocation(),
                const MyDescriptionBox(),
              ],
            ),
          ),
        ],
        body: _tabController != null ? TabBarView(
          controller: _tabController!,
          children: buildCategoryTabs(restaurant.categories, restaurant.menu),
        ) : Center(child: CircularProgressIndicator()), // Show loading indicator while categories are being fetched
      ),
    );
  }
}
