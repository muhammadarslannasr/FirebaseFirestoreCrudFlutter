import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_crud_oper/models/products_model.dart';
import 'package:flutter_firebase_crud_oper/ui/widgets/product_card.dart';
import 'package:flutter_firebase_crud_oper/viewmodels/crud_model.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Product> products;

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<CRUDModel>(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addProduct');
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Center(child: Text('Home')),
      ),
      body: Container(
        child: StreamBuilder(
            stream: productProvider.fetchProductsAsStream(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.data != null) {
                snapshot.connectionState == ConnectionState.waiting
                    ? Center(child: CircularProgressIndicator())
                    : products = snapshot.data.docs
                        .map((doc) => Product.fromMap(doc.data(), doc.id))
                        .toList();
                return products.length == 0
                    ? Center(
                        child: Text(
                          'Sorry no data available.',
                        ),
                      )
                    : ListView.builder(
                        itemCount: products.length,
                        itemBuilder: (buildContext, index) =>
                            ProductCard(productDetails: products[index]),
                      );
              } else {
                return Container();
              }
            }),
      ),
    );
    ;
  }
}
