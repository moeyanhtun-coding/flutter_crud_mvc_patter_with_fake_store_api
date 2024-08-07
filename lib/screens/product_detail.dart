import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crud_mvc_patter_with_fake_store_api/models/product_model.dart';
import 'package:flutter_crud_mvc_patter_with_fake_store_api/screens/widgets/custom_elevated_button.dart';

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: _productDetail(
                  productModel.image.toString(),
                  productModel.title.toString(),
                  productModel.category.toString(),
                  productModel.price.toString(),
                  productModel.description.toString(),
                ),
              ),
              Divider(),
              _detailButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _productDetail(
    String img,
    String title,
    category,
    price,
    description,
  ) {
    return ListView(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image(
            width: double.infinity,
            height: MediaQuery.sizeOf(context).width * 1,
            image: NetworkImage(img),
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 14.5,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          category,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          '\$ $price',
          style: const TextStyle(
            fontSize: 14.5,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Description",
          style: TextStyle(
            fontSize: 14.5,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          description,
          style: const TextStyle(
            fontSize: 14.5,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _detailButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: CustomElevatedButton(
              onPressed: () {},
              label: "Buy Now",
              backGroundColor: Colors.greenAccent,
              textColor: Colors.black,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: CustomElevatedButton(
              onPressed: () {},
              label: "Message",
              backGroundColor: Colors.grey.shade200,
              textColor: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
