import 'package:flutter/material.dart';

import '../database/mongodb.dart';

class ContactScreen extends StatefulWidget {
  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  Future<List<dynamic>> retornarTodosUsuarios() async {
    final db = await MongoDb.connect();

    List<Map<String, Object?>> usuarios = await db.find().toList();

    return usuarios;
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('User List'),
        ),
        body: FutureBuilder<List<dynamic>>(
            future: retornarTodosUsuarios(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else {
                final users = snapshot.data;
                return ListView.builder(
                  itemCount: users?.length,
                  itemBuilder: (context, index) {
                    final user = users![index];
                    return Card(
                      child: ListTile(
                        title: Text(
                          user['name'],
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(user['email']),
                              Text(user['latitude']),
                              Text(user['longitude']),
                            ]),
                      ),
                    );
                  },
                );
              }
            }));
  }
}
