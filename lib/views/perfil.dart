import 'package:avaliacao/database/mongodb.dart';
import 'package:flutter/material.dart';
import 'package:avaliacao/globals.dart' as globals;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    Future<List<dynamic>> retornarUsuario() async {
      final db = await MongoDb.connect();

      List<Map<String, Object?>> usuarios =
          await MongoDb.retornarUsuarioPeloId(globals.usuarioId);

      return usuarios;
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body: FutureBuilder<List<dynamic>>(
          future: retornarUsuario(),
          builder: (context, snapshot) {
            final user = snapshot.data;
            return ListView.builder(
              itemCount: user?.length,
              itemBuilder: (context, index) {
                final user1 = user![index];
                final String latitude = 'latitude - ' + user1['latitude'];
                final String longitude = 'longitude - ' + user1['longitude'];
                return Column(
                  children: [
                    SizedBox(height: 16.0),
                    CircleAvatar(
                      radius: 80,
                      backgroundImage: AssetImage('assets/profile_image.jpg'),
                    ),
                    Text(
                      user1['name'],
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    ListTile(
                      leading: Icon(Icons.email),
                      title: Text(user1['email']),
                    ),
                    ListTile(
                      leading: Icon(Icons.location_on),
                      title: Text(latitude),
                    ),
                    ListTile(
                      leading: Icon(Icons.location_on),
                      title: Text(longitude),
                    ),
                  ],
                );
              },
            );
          },
        ));
  }
}
