import 'package:avaliacao/models/userModel.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:avaliacao/globals.dart' as globals;

class MongoDb{
  static connect() async{
    var db = await Db.create('mongodb+srv://pedro:6Bn1fwVOo9p64pFu@cluster0.p5dgobc.mongodb.net/?retryWrites=true&w=majority');

    await db.open();
    await db.createCollection('flutter-app');
    var collection = db.collection('flutter-app');

    return collection;
  }

  static registrarUsuario(String name, String email, String password, num latitude, num longitude ) async{
    final db = await MongoDb.connect();
    final createdId = ObjectId();
    
    final User user = User(createdId, name, email, password, latitude, longitude);

    final data = {
      '_id' : user.id,
      'name' : user.name,
      'email' : user.email,
      'password' : user.password,
      'latitude' : user.latitude,
      'longitude' : user.longitude
    };

    final id = await db.insert(data);
    return id;
  }

  static loginUsuario(String email, String password) async {
    final db = await MongoDb.connect();

    List <Map<String, Object?>> usuario = await db.find({'email': email}).toList();

    if(usuario.isEmpty){
      throw 'usuário não foi encontrado';
    }

    if(password == usuario[0]['password']){
      globals.isLoggedIn = true;
      final a = usuario[0]['_id'].toString();
      final b = a.split('"')[1];
      globals.usuarioId = ObjectId.fromHexString(b);
      return ObjectId.fromHexString(b);
    }else{
      throw 'não foi possivel efetuar o login';
    }
  }

  static retornarUsuarioPeloId(Object id) async {
    final db = await MongoDb.connect();

    List <Map<String, Object?>> usuarios = await db.find({'_id': id}).toList();

    return usuarios;
  }

  static retornarTodosUsuarios() async {
    final db = await MongoDb.connect();

    List <Map<String, Object?>> usuarios = await db.find().toList();

    return usuarios;
  }
}