import 'package:flutter/material.dart';


import '../database/mongodb.dart';

class ContactScreen extends StatefulWidget {
  @override
  _ContactScreenState createState() => _ContactScreenState();
  

  
}

class _ContactScreenState extends State<ContactScreen> {

Future<List<dynamic>> retornarTodosUsuarios() async {
    final db = await MongoDb.connect();

    List <Map<String, Object?>> usuarios = await db.find().toList();

    return usuarios;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: retornarTodosUsuarios(),
        builder: (context, snapshot) {

            final users = snapshot.data;
            return ListView.builder(
              itemCount: users?.length,
              itemBuilder: (context, index) {
                final user = users![index];
                return ListTile(
                  title: Text(user['name']),
                   subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(user['email']),
                    Text(user['password']),
                    
                  ]),
                );
              },
            );
          }
        ));}
      
    
  }

