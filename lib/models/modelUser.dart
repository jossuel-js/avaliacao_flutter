import 'dart:ffi';

import 'package:mongo_dart/mongo_dart.dart';

class User {
  String name;
  String email;
  String password;
  Float latitude;
  Float longitude;

  User(
    this.name, 
    this.email, 
    this.password, 
    this.latitude,
    this.longitude, 
  );
}
