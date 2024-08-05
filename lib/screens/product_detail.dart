import 'package:flutter/material.dart';
import 'package:flutter_crud_mvc_patter_with_fake_store_api/models/product_model.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    final ProductModel productModel =
        ModalRoute.of(context)?.settings.arguments as ProductModel;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Detail"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(
            children: [
              Expanded(child: _productDetail(productModel.image.toString())),
            ],
          ),
        ),
      ),
    );
  }

  Widget _productDetail(String img) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image(
            width: double.infinity,
            height: MediaQuery.sizeOf(context).width * 1,
            image: NetworkImage(img),
            fit: BoxFit.cover,
          ),
        )
      ],
    );
  }
}
