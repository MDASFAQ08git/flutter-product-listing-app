import 'package:flutter/material.dart';
import 'dart:convert';

void main() {
  runApp(MyApp());
}

const String productJson = '''
[
  {
    "id": 1,
    "name": "Smartphone",
    "description": "High-performance smartphone",
    "image": "https://picsum.photos/200"
  },
  {
    "id": 2,
    "name": "Wireless Headphones",
    "description": "Noise-cancelling audio",
    "image": "https://picsum.photos/200"
  },
  {
    "id": 3,
    "name": "Smartwatch",
    "description": "Fitness tracking watch",
    "image": "https://picsum.photos/200"
  },
    {
    "id": 4,
    "name": "Laptop",
    "description": "MOre Gaming Features",
    "image": "https://picsum.photos/200"
  },
    {
    "id": 5,
    "name": "Camera",
    "description": "take High resolution pics",
    "image": "https://picsum.photos/200"
  },
    {
    "id": 6,
    "name": "TV",
    "description": "42 inch OLED Tv with DOlby dual Speaker",
    "image": "https://picsum.photos/200"
  }
]
''';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductListPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProductListPage extends StatelessWidget {

  final List<Product> productList =
      (jsonDecode(productJson) as List)
          .map((item) => Product.fromJson(item))
          .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product List")),

      body: ListView.builder(
        itemCount: productList.length,
        itemBuilder: (context, index) {

          final product = productList[index];

          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(product.image),
              ),
              title: Text(product.name),
              subtitle: Text(product.description),
            ),
          );
        },
      ),
    );
  }
}

class Product {
  final int id;
  final String name;
  final String description;
  final String image;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
    );
  }
}