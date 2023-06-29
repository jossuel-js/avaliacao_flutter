import 'package:mongo_dart/mongo_dart.dart';

class User{
  final ObjectId id;
  final String name;
  final String email;
  final String password;
  final String latitude;
  final String longitude;

  const User(this.id, this.name, this.email, this.password, this.latitude, this.longitude);
}