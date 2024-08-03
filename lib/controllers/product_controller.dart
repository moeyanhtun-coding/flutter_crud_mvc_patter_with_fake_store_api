import 'package:flutter_crud_mvc_patter_with_fake_store_api/models/product_model.dart';
import 'package:flutter_crud_mvc_patter_with_fake_store_api/services/product_api_service.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var products = <ProductModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var productsResult = await ProductApiService().fetchProducts();
      if (productsResult != null) {
        products.assignAll(productsResult);
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading(false);
    }
  }

  Future<ProductModel> fetchProducDetail(int id) async {
    return await ProductApiService().fetchProductDetail(id);
  }

  void createProduct(ProductModel product) async {
    try {
      isLoading(true);
      var createdProduct = await ProductApiService().createProduct(product);
      if (createdProduct != null) {
        products.add(createdProduct);
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading(false);
    }
  }

  void updateProduct(int id, ProductModel product) async {
    try {
      isLoading(true);
      var patchedProduct = await ProductApiService().patchProduct(id, product);
      if (patchedProduct != null) {
        int index = products.indexWhere((x) => x.id == id);
        products[index] = patchedProduct;
      }
    } finally {
      isLoading(false);
    }
  }

  void deleteProduct(int id) async {
    try {
      isLoading(true);
      await ProductApiService().deleteProduct(id);
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading(false);
      print("success ${id}");
    }
  }
}
