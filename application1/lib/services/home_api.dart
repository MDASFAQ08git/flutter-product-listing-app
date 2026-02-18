import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:application1/models/home_model.dart';



class UserAPI{
 static Future<List<User>> fetchusers() async {
const url = 'https://randomuser.me/api/?results=10';
final uri = Uri.parse(url);
final response = await http.get(uri);
final body = response.body;
final json = jsonDecode(body);
final result = json['results'] as List<dynamic>;

final users = result.map((e) 
{

return User.fromMap(e);

}).toList();

  return users;
}
}