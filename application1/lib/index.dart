
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NumberScreen(),
    );
  }
}

class NumberScreen extends StatefulWidget {
  @override
  _NumberScreenState createState() => _NumberScreenState();
}

class _NumberScreenState extends State<NumberScreen> {
  TextEditingController controller = TextEditingController();
  String result = "";

  void getNumber() {
    try {
      int number = int.parse(controller.text);
      setState(() {
        result = "The entered number is $number";
      });
    } catch (e) {
      setState(() {
        result = "Invalid number";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Number Input")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(controller: controller),
            ElevatedButton(
              onPressed: getNumber,
              child: Text("Submit"),
            ),
            Text(result),
          ],
        ),
      ),
    );
  }
}
