import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Theme Change Screen'),
        ),
        body: Column(
          children: [
            Text('Hi From Theme Screen'),
            ElevatedButton(
              onPressed: () {
                Get.changeThemeMode(ThemeMode.dark);
              },
              child: Text('Change Theme'),
            ),
          ],
        ));
  }
}
