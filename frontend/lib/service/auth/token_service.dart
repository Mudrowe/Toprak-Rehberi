import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Function to get token from shared preferences
Future<String?> getAuthToken() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('authToken');
}

// Function to set token in shared preferences
Future<void> setAuthToken(String token) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('authToken', token);

  print('Token saved: $token');
}

// Function to decode JWT token and extract email
String? getEmailFromToken(String token) {
  Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
  return decodedToken['sub'] as String?;
}
