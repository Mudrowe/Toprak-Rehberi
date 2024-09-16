import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../../dtos/ProductDTO.dart';
import '../../dtos/UserDTO.dart';
import '../fetching/pages/fetch_user.dart';

Future<void> addProduct(ProductDTO productDTO) async {
  var ipAddress = dotenv.env['IP_ADDRESS'];
  var baseUrl = 'http://$ipAddress:8080/api/product';

  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('authToken');

  if (token == null) {
    throw Exception('No auth token found. Please log in.');
  }

  UserDTO user = await fetchUser();
  int userId = user.id!;

  final url = Uri.parse(baseUrl);

  productDTO.land.userId = userId;


  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    },
    body: jsonEncode(productDTO.toJson()),
  );

  // Log the JSON payload being sent to the backend
  //print('Sending ProductDTO JSON 2: ${jsonEncode(productDTO.toJson())}');
  print('Planting Date: ${productDTO.plantingDate}');

  if (response.statusCode == 201) {
    // Product added successfully
    print('Product added: ${response.body}');
  } else {
    // Error handling
    print('Failed to add product: ${response.statusCode}');
  }
}
