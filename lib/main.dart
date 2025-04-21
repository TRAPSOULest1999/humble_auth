import 'package:flutter/material.dart';
import 'features/auth/login.dart';
import 'features/auth/home.dart'; 


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Humble Auth App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/home': (context) {
          final token = ModalRoute.of(context)!.settings.arguments as String;
          return HomePage(token: token);
        },
      },
    );
  }
}