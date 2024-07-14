import 'package:flutter/material.dart';
import 'package:flutter_task/models/product_model.dart';
import 'product_card.dart';

class ProductGrid extends StatelessWidget {
  final List<Product> products;

  ProductGrid({required this.products});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(10.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        childAspectRatio: 0.7,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductCard(product: products[index]);
      },
    );
  }
}
