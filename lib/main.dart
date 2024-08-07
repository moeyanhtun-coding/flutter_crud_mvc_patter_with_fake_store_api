import 'package:flutter/material.dart';
import 'package:flutter_crud_mvc_patter_with_fake_store_api/screens/LoginAndRegister/login_page.dart';
import 'package:flutter_crud_mvc_patter_with_fake_store_api/screens/LoginAndRegister/register_page.dart';
import 'package:flutter_crud_mvc_patter_with_fake_store_api/screens/product_detail.dart';
import 'package:flutter_crud_mvc_patter_with_fake_store_api/screens/product_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/detail': (context) => ProductDetail(),
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage()
      },
      debugShowCheckedModeBanner: false,
      home: ProductList(),
    );
  }
}
