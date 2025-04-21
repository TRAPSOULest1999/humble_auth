import 'package:flutter/material.dart';
import '../constants/auth_constants.dart';
import 'form_input_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.formBackground,
      elevation: 8,
      margin: const EdgeInsets.symmetric(horizontal: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Login", style: AppTextStyles.header),
            const SizedBox(height: 20),
            const FormInputField(label: 'Email', icon: Icons.email),
            const SizedBox(height: 16),
            const FormInputField(label: 'Password', icon: Icons.lock, obscure: true),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  Checkbox(value: false, onChanged: (val) {}),
                  const Text("Remember me", style: AppTextStyles.label),
                ]),
                TextButton(
                  onPressed: () {},
                  child: const Text("Forgot Password?", style: AppTextStyles.link),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Will call controller/service later
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text("Login Now", style: AppTextStyles.button),
              ),
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: () {},
              child: const Text("Don't have an account? Signup", style: AppTextStyles.link),
            ),
          ],
        ),
      ),
    );
  }
}