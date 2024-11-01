import 'package:teko/model/product_model.dart';

class ProductList {
  final List<Product>? items;

  ProductList({this.items});

  factory ProductList.fromJson(Map<String, dynamic> json) => ProductList(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList());
}
