import 'package:flutter/material.dart';
import 'package:flutter_task/cubit/product_cubit.dart';
import 'package:flutter_task/models/ViewModel/product_view_model.dart';
import 'package:flutter_task/models/product_model.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProductViewModel>(
      create: (context) => ProductViewModel(context.read<ProductCubit>()),
      child: Consumer<ProductViewModel>(
        builder: (context, viewModel, child) {
          return Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromARGB(255, 0, 77, 139),
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 5.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Image.network(
                          product.thumbnail,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          product.title,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          product.description,
                          style: TextStyle(color: Colors.grey),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          children: [
                            Text(
                              'EGP ${product.price}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 5),
                            Text(
                              'EGP ${(product.price * 1.2).toStringAsFixed(2)}',
                              style: TextStyle(
                                fontSize: 10,
                                color: Color.fromARGB(255, 13, 93, 213),
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Row(
                          children: [
                            Text('Review '),
                            Text('(${product.rating.toString()})'),
                            SizedBox(width: 5),
                            Icon(Icons.star, color: Colors.amber, size: 20),
                            Spacer(),
                            IconButton(
                              icon: Icon(
                                Icons.add_circle_outline,
                                color: Color.fromARGB(
                                    255, 0, 77, 139), // اللون الأزرق
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 10.0,
                right: 10.0,
                child: Container(
                  width: 38.0,
                  height: 38.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 240, 236, 236),
                  ),
                  child: IconButton(
                    icon: Icon(
                      context.watch<ProductViewModel>().isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: context.watch<ProductViewModel>().isFavorite
                          ? Colors.red
                          : Color.fromARGB(255, 0, 77, 139),
                    ),
                    onPressed: () {
                      context.read<ProductViewModel>().toggleFavorite();
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
