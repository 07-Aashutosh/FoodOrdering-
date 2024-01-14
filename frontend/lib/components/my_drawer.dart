import 'package:flutter/material.dart';
import 'package:frontend/components/my_drawer_tile.dart';
import 'package:frontend/pages/profile_page.dart';
import '../pages/login.dart';
import '../pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          // App logo with appropriate padding and sizing
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Image.asset(
              'lib/assets/logo/logo.jpg',
              width: 120,  // Adjust width as necessary
              height: 120, // Adjust height as necessary
            ),
          ),
          // Divider with all-around padding
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Divider(),
          ),
          // Navigation tile for Home
          MyDrawerTile(
            text: "H O M E",
            icon: Icons.home,
            onTap: () {
              Navigator.pop(context);
              // Add navigation to the Home page if necessary here
            },
          ),
          // Navigation tile for Settings
          MyDrawerTile(
            text: "S E T T I N G S",
            icon: Icons.settings,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SettingsPage()));
            },
          ),
         const Divider(),
          //  MyDrawerTile(
          //   text: "P R O F I L E",
          //   icon: Icons.account_box_rounded,
          //   onTap: () {
          //     Navigator.pop(context);
          //      Navigator.pushReplacement(context,
          //         MaterialPageRoute(builder: (context) => const ProfilePage()));
          //     // Add navigation to the Home page if necessary here
          //   },
          // ),
          const Spacer(),
          // Navigation tile for Logout
          MyDrawerTile(
            text: "L O G O U T",
            icon: Icons.logout,
            onTap: () {
              Navigator.pop(context);
              // Navigate to the login screen or handle logout logic
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const LoginPage()));
            },
          ),
          const SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}
