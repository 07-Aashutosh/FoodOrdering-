import 'package:flutter/material.dart';
import 'package:frontend/pages/cart_page.dart';

class MySliverAppBar extends StatelessWidget {
  final Widget child;
  final Widget title;
  MySliverAppBar({Key? key, required this.child, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 340,
      collapsedHeight: 80,
      floating: false,
      pinned: true,
      actions: [
        IconButton(
            onPressed: () {
              //go to cart page
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CartPage()
                  )
                  );
            },
            icon: Icon(Icons.shopping_cart))
      ],
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: const Center(child: Text("Chiya Chautari")),
      //     leading: IconButton(
      //   icon: Icon(Icons.account_circle_rounded), // Change to your custom icon
      //   onPressed: () {
      //     // Handle drawer opening
      //   },

      // ),
      //
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(bottom: 50.0),
          child: child,
        ),
        title: title,
        centerTitle: true,
        titlePadding: const EdgeInsets.only(left: 0, right: 0, top: 0),
        expandedTitleScale: 1,
      ),
    );
  }
}
