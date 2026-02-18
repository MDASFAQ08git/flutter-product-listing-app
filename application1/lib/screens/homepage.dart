import 'package:application1/models/home_model.dart';
import 'package:application1/services/home_api.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  List<User> users= [];

@override
  void initState() {
    super.initState();
    fetchusers();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Rest API CALL"),),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context , index) {
          final user = users[index];
          // final picture = user.picture;
          return ListTile(
            leading: ClipRRect(
            //   borderRadius: BorderRadiusGeometry.circular(100),
            // child: Image.network(user.picture.thumbnail),
            // Text('${index + 1}'), ,
            ),
            title: Text(user.fullName),
            subtitle: Text(user.phone),
          );
        }
      ),
      // floatingActionButton: FloatingActionButton(onPressed: fetchusers,
      // ), 
    );
  }


Future<void> fetchusers() async{
final response = await UserAPI.fetchusers();
setState(() {
  users = response;
});
}
}