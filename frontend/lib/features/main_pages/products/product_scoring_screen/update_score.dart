import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../../../../dtos/ProductDTO.dart';


Future<void> updateProductScore(ProductDTO productDTO) async {
  var ipAddress = dotenv.env['IP_ADDRESS'];
  var baseUrl = 'http://$ipAddress:8080/api/product/score/${productDTO.id}';
  final url = Uri.parse(baseUrl);

  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('authToken');

  if (token == null) {
    throw Exception('No auth token found. Please log in.');
  }

  print('ProductDTO Score: ${productDTO.score}');
  print('ProductDTO Harvested: ${productDTO.isHarvested}');


  final response = await http.put(
    url,
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    },
    body: jsonEncode(productDTO),
  );

  // Log the JSON payload being sent to the backend
  print('Updating ProductDTO JSON: ${productDTO.toJson()}');
  print('Response Status Code: ${response.statusCode}');

  if (response.statusCode == 200) {
    print('Product updated: ${response.body}');
  } else {
    print('Failed to update product: ${response.statusCode}');
  }
}
