import 'package:flutter/material.dart';
import 'widgets/login_form.dart';
//import 'constants/auth_constants.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('../web/images/pos-sale-counter.jpeg', fit: BoxFit.cover),
          ),
          Positioned.fill(
            child: Container(color: Colors.black.withOpacity(0.6)),
          ),
          const Center(child: SingleChildScrollView(child: LoginForm())),
        ],
      ),
    );
  }
}