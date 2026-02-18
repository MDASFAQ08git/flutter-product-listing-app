import 'package:application1/models/UserModel.dart';
import 'package:application1/models/dob_model.dart';
import 'package:application1/models/location_model.dart';
import 'package:application1/models/picture_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class User{
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final String nat;
  final Username name;
  final UserDOB dob;
  final UserLocation location;
  final UserPicture picture;

  User({
    required this.gender,
    required this.email,
    required this.phone,
    required this.cell,
    required this.nat,
    required this.name,
    required this.dob,
    required this.location,
    required this.picture,
    });



factory User.fromMap(Map<String, dynamic> e){
    
// user name
final name = Username.fromMap(e['name']);
//dob
final dob = UserDOB.fromMap(e['dob']);
//location
final location = UserLocation.fromMap(e['location']);
//picture
final picture = UserPicture.fromMap(e['picture']);

   return User(
    email: e['email'],
    gender: e['gender'],
    phone: e['phone'],
    cell: e['cell'], 
    nat: e['nat'],
    name: name,
    dob: dob,
    location: location,
    picture: picture,
    );
  } 

String get fullName{
  return '${name.title} ${name.first} ${name.last}';
}
}




