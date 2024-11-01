import 'dart:io';

class Product {
   String name;
   int price;
  final String imageSrc;
  final File? imageFile;

  Product({required this.name, required this.price, required this.imageSrc, this.imageFile});

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        name: json['name'] as String,
        price: json['price'] as int,
        imageSrc: json['imageSrc'] as String,
      );
}
