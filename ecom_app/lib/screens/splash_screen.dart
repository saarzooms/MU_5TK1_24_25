import 'dart:async';

import 'package:ecom_app/screens/master_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () async {
      // Obtain shared preferences.
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String uname = await prefs.getString('unm') ?? '';
      if (uname == '') {
//navigate to login screen
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ),
        );
      } else {
//navigate to login screen
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => MasterScreen(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: Center(
            child: Text(
              'Ecom App',
              style: TextStyle(fontSize: 40),
            ),
          ),
        ),
        Text('Developed By: Arzoo'),
      ],
    ));
  }
}
