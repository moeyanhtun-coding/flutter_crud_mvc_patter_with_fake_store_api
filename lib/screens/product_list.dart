import 'dart:ffi';

import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crud_mvc_patter_with_fake_store_api/controllers/product_controller.dart';
import 'package:flutter_crud_mvc_patter_with_fake_store_api/screens/widgets/product_card.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../models/product_model.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final ProductController productController = Get.put(ProductController());
  late bool isDelete;
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
                    child: InkWell(
                      child: ProductCard(
                        imageUrl: product.image!,
                        category: product.category!,
                        price: product.price!,
                        title: product.title!,
                        onDelete: () async {
                          if (await confirm(
                            context,
                            title: const Text('Confirm'),
                            content: const Text('Would you like to remove?'),
                            textOK: const Text('Yes'),
                            textCancel: const Text('No'),
                          )) {
                            isDelete = await productController
                                .deleteProduct(product.id!);
                            if (isDelete) {
                              showToast("Deleting Successful", Colors.black,
                                  Colors.greenAccent);
                            }
                          }
                        },
                        onEdit: () {},
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, '/detail',
                            arguments: product);
                      },
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

  void showToast(String message, Color textColor, backgroundColor) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: backgroundColor,
        textColor: textColor,
        fontSize: 16.0);
  }
}
