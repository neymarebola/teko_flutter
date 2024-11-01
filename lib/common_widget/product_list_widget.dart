import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teko/home/bloc/home_bloc.dart';
import 'package:teko/home/bloc/home_state.dart';
import 'package:teko/model/product_model.dart';

class ProductListWidget extends StatelessWidget {
  final List<Product> items;

  const ProductListWidget({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {

       Product newProduct = Product(name: '', price: 0, imageSrc: '');
      if (state is SetProductNameState) {
        newProduct.name = state.name;
      }
      if (state is SetProductPriceState) {
        newProduct.price = state.price;
      }

      items.insert(0, newProduct);

      return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        // Tắt cuộn riêng của GridView nếu nằm trong cuộn khác
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Số cột
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 0.7, // Tỉ lệ chiều rộng/chiều cao cho mỗi ô
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return buildProductItem(items[index]);
        },
      );
    });
  }

  Widget buildProductItem(Product product) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: FadeInImage.assetNetwork(
              placeholder: 'https://picsum.photos/id/237/200/300', // Path to your placeholder image
              image: product.imageSrc, // URL of your image
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              product.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text('\$${product.price}'),
          ),
        ],
      ),
    );
  }
}
