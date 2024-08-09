import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String unm = '';
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
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Center(
        child: Text('Welcome $unm'),
      ),
    );
  }
}
