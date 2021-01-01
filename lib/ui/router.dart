import 'package:flutter/material.dart';
import 'package:flutter_firebase_crud_oper/ui/views/add_product.dart';
import 'package:flutter_firebase_crud_oper/ui/views/home_view.dart';
import 'package:flutter_firebase_crud_oper/ui/views/product_details.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/' :
        return  MaterialPageRoute(
            builder: (_)=> HomeView()
        );
      case '/addProduct' :
        return MaterialPageRoute(
            builder: (_)=> AddProduct()
        ) ;
      case '/productDetails' :
        return MaterialPageRoute(
            builder: (_)=> ProductDetails()
        ) ;
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            ));
    }
  }
}