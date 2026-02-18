import 'dart:io';

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
    "image": "https://picsum.photos/seed/smartphone/200"
  },
  {
    "id": 2,
    "name": "Wireless Headphones",
    "description": "Noise-cancelling audio",
    "image": "https://picsum.photos/seed/headphones/200"
  },
  {
    "id": 3,
    "name": "Smartwatch",
    "description": "Fitness tracking watch",
    "image": "https://picsum.photos/seed/smartwatch/200"
  },
  {
    "id": 4,
    "name": "Laptop",
    "description": "More Gaming Features",
    "image": "https://picsum.photos/seed/laptop/200"
  },
  {
    "id": 5,
    "name": "Camera",
    "description": "Take High resolution pics",
    "image": "https://picsum.photos/seed/camera/200"
  },
  {
    "id": 6,
    "name": "TV",
    "description": "42 inch OLED TV with Dolby dual Speaker",
    "image": "https://picsum.photos/seed/television/200"
  },
  {
    "id": 7,
    "name": "Tablet",
    "description": "Android 16 tablet",
    "image": "https://picsum.photos/seed/tablet/200"
  },
  {
    "id": 8,
    "name": "Powerbank",
    "description": "5000mah powerbank by Redmi",
    "image": "https://picsum.photos/seed/powerbank/200"
  }
]

''';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductListPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
    fontFamily: 'Georgia',
    ),
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
      appBar: AppBar(title: Text("Product List", 
      style: TextStyle(color: Colors.redAccent[700],),),
      backgroundColor: Colors.lightBlueAccent,),
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
      floatingActionButton: FloatingActionButton(
    onPressed: () {},
    child: Icon(Icons.chat),
  ),
    );
  }

  void exha(){
  try{
  print("Enter a number");
  int? number = int.parse(stdin.readLineSync()!);
  print("The entered number is $number");
  }catch(e){
    print(Exception(e));
  }
}

}

class DataListPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Data List"),backgroundColor: const Color.fromARGB(255, 186, 16, 22),),
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