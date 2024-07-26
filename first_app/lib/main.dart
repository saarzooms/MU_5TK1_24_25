import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: SizedBox(
        width: 600,
        height: 500,
        child: Row(
          children: [
            Container(width: 100, height: 100, color: Colors.red),
            Container(width: 300, height: 100, color: Colors.green),
            Container(width: 200, height: 100, color: Colors.red),
          ],
        ),
      ),
    ),
  ));
}
