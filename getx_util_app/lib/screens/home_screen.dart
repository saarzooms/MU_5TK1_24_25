import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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
            Text(
              'hello'.tr,
              style: GoogleFonts.lato().copyWith(fontSize: 30),
            ),
            Text(
              'hello'.tr,
              style: GoogleFonts.sixtyfour().copyWith(fontSize: 30),
            ),
            Text(
              'hello'.tr,
              style: GoogleFonts.alegreyaSansSc().copyWith(fontSize: 30),
            ),
            Text('welcome'.tr),
            Text('bye'.tr),
            ElevatedButton(
              onPressed: () {
                Get.updateLocale(Locale('en'));
              },
              child: Text(
                'English',
                style: GoogleFonts.lato().copyWith(
                  fontSize: 20,
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Get.updateLocale(Locale('ar'));
                },
                child: Text(
                  'Arbic',
                  style: GoogleFonts.rajdhani().copyWith(
                    fontSize: 20,
                  ),
                )),
            ElevatedButton(
                onPressed: () {
                  Get.updateLocale(Locale('hi'));
                },
                child: Text('Hindi')),
          ],
        ));
  }
}
