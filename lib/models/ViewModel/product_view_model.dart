import 'package:flutter/foundation.dart';
import 'package:flutter_task/cubit/product_cubit.dart';
import 'package:flutter_task/models/product_model.dart';

class ProductViewModel extends ChangeNotifier {
  final ProductCubit productCubit;
  bool _isFavorite = false;

  ProductViewModel(this.productCubit);

  void loadProduct() {
    productCubit.fetchProduct();
  }

  List<Product> get product => productCubit.state;

  bool get isFavorite => _isFavorite;

  void toggleFavorite() {
    _isFavorite = !_isFavorite;
    notifyListeners();
  }
}
