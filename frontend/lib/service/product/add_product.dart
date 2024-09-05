import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../dtos/ProductDTO.dart';

Future<void> addProduct(ProductDTO productDTO) async {
  var ipAddress = dotenv.env['IP_ADDRESS'];
  var baseUrl = 'http://$ipAddress:8080/api/product';
  final url = Uri.parse(baseUrl);

  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode(productDTO.toJson()),
  );

  // Log the JSON payload being sent to the backend
  print('Sending ProductDTO JSON: ${jsonEncode(productDTO.toJson())}');

  if (response.statusCode == 201) {
    // Product added successfully
    print('Product added: ${response.body}');
  } else {
    // Error handling
    print('Failed to add product: ${response.statusCode}');
  }
}
