import 'dart:convert';
import 'package:http/http.dart' as http;

class UserService {
  static const String baseUrl = 'http://localhost:8000';

  static Future<Map<String, dynamic>?> updateProfile({
    required String token,
    String? firstName,
    String? lastName,
  }) async {
    final url = Uri.parse('$baseUrl/user/update');
    final response = await http.patch(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        if (firstName != null) 'first_name': firstName,
        if (lastName != null) 'last_name': lastName,
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print('Update failed: ${response.body}');
      return null;
    }
  }
}