import 'package:ecom_app/screens/dashboard_screen.dart';
import 'package:ecom_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'cart_screen.dart';
import 'settings_screen.dart';

class MasterScreen extends StatefulWidget {
  const MasterScreen({super.key});

  @override
  State<MasterScreen> createState() => _MasterScreenState();
}

class _MasterScreenState extends State<MasterScreen> {
  String unm = '';
  int currIdx = 0;
  List screens = [DashboardScreen(), CartScreen(), SettingsScreen()];
  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  fetchUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    unm = await prefs.getString('unm') ?? '';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hi, $unm'), actions: [
        IconButton(
          onPressed: () async {
            final SharedPreferences prefs =
                await SharedPreferences.getInstance();
            await prefs.setString('unm', '');
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ),
            );
          },
          icon: Icon(Icons.power_settings_new),
        ),
      ]),
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
