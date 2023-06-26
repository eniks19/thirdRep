import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:sign/components/my_drawer.dart';
import 'package:sign/pages/home_page.dart';
import 'package:sign/pages/profile_page.dart';
import 'package:sign/pages/settings_page.dart';
import 'package:sign/pages/shop_page.dart';
import 'package:sign/pages/signup.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    HomePage(),
    ShopPage(),
    ProfilePage(),
    SettingPage(),
  ];
  int currentindex = 0;
  void onTap(int index) {
    setState(() {
      currentindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () => Scaffold.of(context).openDrawer(),
          child: Icon(
            Icons.menu,
            color: Colors.grey.shade800,
          ),
        ),
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 40.0),
            child: Text(
              'A P P',
              style: TextStyle(color: Colors.grey.shade800),
            ),
          ),
        ),
      ),
      drawer: MyDrawer(),
      body: pages[currentindex],
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
          child: GNav(
              onTabChange: onTap,
              tabBackgroundColor: Colors.grey.shade800,
              //   backgroundColor: Colors.black,
              color: Colors.white,
              activeColor: Colors.white,
              gap: 8,
              padding: EdgeInsets.all(16),
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.shopping_bag_rounded,
                  text: 'Shop',
                ),
                GButton(
                  icon: Icons.person,
                  text: 'Profile',
                ),
                GButton(
                  icon: Icons.settings,
                  text: 'Setting',
                )
              ]),
        ),
      ),
    );
  }
}
