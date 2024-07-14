import 'package:flutter_task/models/product_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductService {
  Future<List<Product>> fetchProduct() async {
    final response =
        await http.get(Uri.parse('https://dummyjson.com/products#'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body)['products'];
      return data.map((item) => Product.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load shoes');
    }
  }
}
