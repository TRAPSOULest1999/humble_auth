import 'package:flutter/material.dart';
import 'features/auth/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Humble Auth Login',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
