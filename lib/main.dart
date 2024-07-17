import 'package:flutter/material.dart';
import 'package:flutter_validate_test/view/login_screen/login_screen.dart';

String registerEmail = '';
String registerPassword = '';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
