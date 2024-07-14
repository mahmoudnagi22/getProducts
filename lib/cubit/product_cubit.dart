import 'package:bloc/bloc.dart';
import 'package:flutter_task/models/product_model.dart';
import 'package:flutter_task/services/product_service.dart';

class ProductCubit extends Cubit<List<Product>> {
  final ProductService productService;

  ProductCubit(this.productService) : super([]);

  void fetchProduct() async {
    try {
      final product = await productService.fetchProduct();
      emit(product);
    } catch (e) {
      emit([]);
    }
  }
}
