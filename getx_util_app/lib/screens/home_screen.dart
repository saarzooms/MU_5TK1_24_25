import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My language page'),
        ),
        body: Column(
          children: [
            Text('hello'.tr),
            Text('welcome'.tr),
            Text('bye'.tr),
            ElevatedButton(
                onPressed: () {
                  Get.updateLocale(Locale('en'));
                },
                child: Text('English')),
            ElevatedButton(
                onPressed: () {
                  Get.updateLocale(Locale('ar'));
                },
                child: Text('Arbic')),
            ElevatedButton(
                onPressed: () {
                  Get.updateLocale(Locale('hi'));
                },
                child: Text('Hindi')),
          ],
        ));
  }
}
