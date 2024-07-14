import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/models/ViewModel/product_view_model.dart';
import 'package:flutter_task/models/product_model.dart';
import 'package:flutter_task/services/product_service.dart';
import 'cubit/product_cubit.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/product_grid.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productService = ProductService();
    return MaterialApp(
      title: 'Product Store',
      home: BlocProvider<ProductCubit>(
        create: (context) => ProductCubit(productService)..fetchProduct(),
        child: ProductStorePage(),
      ),
    );
  }
}

class ProductStorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productCubit = BlocProvider.of<ProductCubit>(context);
    final productViewModel = ProductViewModel(productCubit);

    return Scaffold(
      appBar: CustomAppBar(),
      body: BlocBuilder<ProductCubit, List<Product>>(
        builder: (context, products) {
          if (products.isEmpty) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ProductGrid(products: productViewModel.product);
          }
        },
      ),
    );
  }
}
