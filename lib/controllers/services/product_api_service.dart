import 'dart:convert';

import '../../models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductApiService {
  final String baseUrl = 'https://fakestoreapi.com/products';

  //* this is get products list function
  Future<List<ProductModel>> fetchProducts() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      return body.map((dynamic item) => ProductModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  //* this is get product detail
  Future<ProductModel> fetchProductDetail(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/$id'));
    if (response.statusCode == 200) {
      return ProductModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load product');
    }
  }

  //* this is create product
  Future<ProductModel> createProduct(ProductModel product) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {"Content-Type": "application/json"},
      body: json.encode(product.toJson()),
    );
    if (response.statusCode == 200) {
      return ProductModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create product');
    }
  }

  //* this is update product
  Future<ProductModel> patchProduct(int id, ProductModel product) async {
    final response = await http.patch(
      Uri.parse('$baseUrl/$id'),
      headers: {"Content-Type": "application/json"},
      body: json.encode(product.toJson()),
    );
    if (response.statusCode == 200) {
      return ProductModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update product');
    }
  }

//* this is delete products
  Future<bool> deleteProduct(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
