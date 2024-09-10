import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../models/product_option.dart';

Future<List<ProductOption>> fetchProductOptions() async {
  var ipAddress = dotenv.env['IP_ADDRESS'];
  var baseUrl = 'http://$ipAddress:8080/api/product_option';

  final response = await http.get(Uri.parse(baseUrl));

  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body);
    return data.map((json) => ProductOption.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load product options');
  }
}

Future<ProductOption> fetchProductOptionById(int? id) async {
  var ipAddress = dotenv.env['IP_ADDRESS'];
  var baseUrl = 'http://$ipAddress:8080/api/product_option/$id';

  final response = await http.get(Uri.parse(baseUrl));

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body);
    return ProductOption.fromJson(jsonData);
  } else {
    // Handle errors
    throw Exception(
        'Failed to load product option. Status code: ${response.statusCode}');
  }
}
