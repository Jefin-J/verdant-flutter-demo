import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:login_demo/models/product_model.dart';
import 'package:login_demo/widgets/product_card.dart';
import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<ProductInfo> products = [];

  @override
  void initState() {
    _fetchProducts();
    super.initState();
  }

  void _fetchProducts() async {
    var response = await http.get(Uri.parse('https://dummyjson.com/products'));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      for (var product in data['products']) {
        setState(() {
          products.add(ProductInfo.fromJson(product));
        });
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Failed to fetch Products')));
    }
  }

  @override
  Widget build(BuildContext context) {
    print(products);
    return Scaffold(
      appBar: AppBar(
        title: Text("Home page"),
      ),
      body: products.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) => ProductCard(
                product: products[index],
              ),
            ),
    );
  }
}
