import 'package:ecom_app/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';

import 'cart_screen.dart';
import 'settings_screen.dart';

class MasterScreen extends StatefulWidget {
  const MasterScreen({super.key});

  @override
  State<MasterScreen> createState() => _MasterScreenState();
}

class _MasterScreenState extends State<MasterScreen> {
  int currIdx = 0;
  List screens = [DashboardScreen(), CartScreen(), SettingsScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currIdx],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currIdx,
          onTap: (v) {
            currIdx = v;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: 'Cart'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings'),
          ]),
    );
  }
}
