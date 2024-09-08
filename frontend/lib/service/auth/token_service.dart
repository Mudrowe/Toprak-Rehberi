import 'package:shared_preferences/shared_preferences.dart';

// Function to get token from shared preferences
Future<String?> getAuthToken() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('authToken');
}
