import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';

class MongoDB{
  static connect() async{
    var db = await Db.create('mongodb+srv://pedro:6Bn1fwVOo9p64pFu@cluster0.p5dgobc.mongodb.net/?retryWrites=true&w=majority');

    await db.open();

    inspect(db);
    await db.createCollection('user');
    var collection = db.collection('user');

    return collection;
  }
}