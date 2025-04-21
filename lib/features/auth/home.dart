import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'services/user_service.dart';

class HomePage extends StatefulWidget {
  final String token;
  const HomePage({super.key, required this.token});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _firstName = TextEditingController();
  final _lastName = TextEditingController();

  Future<void> _updateUser() async {
    final result = await UserService.updateProfile(
      token: widget.token,
      firstName: _firstName.text.trim(),
      lastName: _lastName.text.trim(),
    );
    if (result != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Updated successfully")),
      );
    }
  }

void _logout() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('auth_token');
  Navigator.of(context).pushReplacementNamed('/');
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Profile"),
        actions: [
          IconButton(
            onPressed: _logout,
            icon: const Icon(Icons.power_settings_new),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _firstName,
              decoration: const InputDecoration(labelText: "First Name"),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _lastName,
              decoration: const InputDecoration(labelText: "Last Name"),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _updateUser,
              child: const Text("Save Changes"),
            )
          ],
        ),
      ),
    );
  }
}
