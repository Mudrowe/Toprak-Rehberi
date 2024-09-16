import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../../../dtos/ProductOptionDTO.dart';
import '../../../models/product_option.dart';

Future<List<ProductOption>> fetchProductOptions() async {
  var ipAddress = dotenv.env['IP_ADDRESS'];
  var baseUrl = 'http://$ipAddress:8080/api/product_option';

  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('authToken');

  if (token == null) {
    throw Exception('No auth token found. Please log in.');
  }

  final url = Uri.parse(baseUrl);

  final response = await http.get(
    url,
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    },
  );

  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body);
    return data.map((json) => ProductOption.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load product options');
  }
}

Future<ProductOptionDTO> fetchProductOptionById(int? id) async {
  var ipAddress = dotenv.env['IP_ADDRESS'];
  var baseUrl = 'http://$ipAddress:8080/api/product_option/byId/$id';

  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('authToken');

  final url = Uri.parse(baseUrl);

  final response = await http.get(
    url,
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    },
  );

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body);
    print('Received Product Option JSON: ${jsonEncode(jsonData)}');
    return ProductOptionDTO.fromJson(jsonData);
  } else {
    throw Exception(
        'Failed to load product option. Status code: ${response.statusCode}');
  }
}
