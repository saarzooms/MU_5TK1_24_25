import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController txtUname = TextEditingController();
  TextEditingController txtPwd = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Login Form',
          style: TextStyle(fontSize: 50),
        ),
        TextField(
          controller: txtUname,
          decoration: InputDecoration(
            labelText: 'Username',
            hintText: 'Enter your username',
          ),
        ),
        TextField(
          controller: txtPwd,
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Password',
            hintText: 'Enter your password',
          ),
        ),
        ElevatedButton(
          onPressed: () {
            print('from login button clicked ${txtUname.text} ${txtPwd.text}');
          },
          child: Text('Login'),
        ),
      ],
    ));
  }
}
