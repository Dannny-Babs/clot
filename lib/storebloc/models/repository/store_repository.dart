// ignore_for_file: non_constant_identifier_names

import 'package:clot/utils/store.dart';
import 'package:dio/dio.dart';

class StoreRepository {
  final Dio _client =
      Dio(BaseOptions(baseUrl: 'https://fakestoreapi.com/products'));

  Future<List<Product>> getProducts() async {
    final response = await _client.get('');
    return (response.data as List)
        .map((Json) => Product(
            id: Json['id'],
            title: Json['title'],
            description: Json['description'],
            price: Json['price'].toDouble(),
            image: Json['image']))
        .toList();
  }
}
