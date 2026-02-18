import 'package:application1/index.dart';
import 'package:flutter/material.dart';
import 'package:application1/screens/homepage.dart';

// void main() {
//   runApp(MaterialApp(
//     home: HomeScreen(),
//   ));
// }

void main(){
  runApp(MyApp());  
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homepage(),
    
    );
  }

}