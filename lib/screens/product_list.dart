import 'package:flutter/material.dart';
import 'package:flutter_crud_mvc_patter_with_fake_store_api/controllers/product_controller.dart';
import 'package:flutter_crud_mvc_patter_with_fake_store_api/widgets/product_card.dart';
import 'package:get/get.dart';

import '../models/product_model.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
      ),
      body: Obx(
        () {
          if (productController.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: productController.products.length,
              itemBuilder: (context, index) {
                ProductModel product = productController.products[index];
                return Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).width * 0.5,
                    child: ProductCard(
                      imageUrl: '${product.image}',
                      category: '${product.category}',
                      price: product.price!,
                      title: '${product.title}',
                      onDelete: () {},
                      onEdit: () {},
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // Navigate to a form to create a new product
        },
      ),
    );
  }
}
