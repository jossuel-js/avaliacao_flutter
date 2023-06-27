import 'dart:ffi';
import 'dart:js_interop';

import 'package:avaliacao/database/mongodb.dart';
import 'package:avaliacao/models/modelUser.dart';
import 'package:mongo_dart/mongo_dart.dart';

class UserController{

  static registro(String name, String email, String password, Float latitude, Float longitude) async{
    var db = await MongoDB.connect();
  
    final User user = User(name, email, password, latitude, longitude);

    final data = {
      '_id' : ObjectId(),
      'name' : user.name,
      'email': user.email,
      'password' : user.password,
      'latitude' : user.latitude,
      'longitude' : user.longitude,
    };

    final id = db.insert(data);

    return id;
  }

  static login(String email, String password) async{
    var db = await MongoDB.connect();

    final user = await db.find({'email': email});

    if(user.password == password){
      return true;
    }else{
      return false;
    }
  }

  static getUser() async{
    var db = await MongoDB.connect();

    final List<Map<String,Object?>> users = await db.find().toList();

    return users;
  }
}