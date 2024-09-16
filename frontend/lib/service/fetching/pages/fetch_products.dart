import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toprak_rehberi/dtos/ProductDTO.dart';

import '../../../dtos/UserDTO.dart';
import 'fetch_user.dart';

Future<List<ProductDTO>> fetchProducts() async {
  // Get token from SharedPreferences
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('authToken');

  UserDTO user = await fetchUser();
  int userId = user.id!;

  //print('userId: $userId');

  var ipAddress = dotenv.env['IP_ADDRESS'];
  var baseUrl = 'http://$ipAddress:8080/api/product/byUserId/$userId';
  final url = Uri.parse(baseUrl);

  final response = await http.get(
    url,
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    },
  );

  if (response.statusCode == 200) {
    List<dynamic> productList = json.decode(response.body);
    return productList.map((json) => ProductDTO.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load products');
  }
}
