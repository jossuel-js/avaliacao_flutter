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
          title: const Text('Profile'),
        ),
        body: FutureBuilder<List<dynamic>>(
            future: retornarUsuario(),
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
                final user = snapshot.data;
                return ListView.builder(
                  itemCount: user?.length,
                  itemBuilder: (context, index) {
                    final user1 = user![index];
                    final String latitude = 'latitude - ' + user1['latitude'];
                    final String longitude =
                        'longitude - ' + user1['longitude'];
                    return Column(
                      children: [
                        const SizedBox(height: 16.0),
                        const CircleAvatar(
                          radius: 80,
                          backgroundImage:
                              AssetImage('assets/profile_image.jpg'),
                        ),
                        Text(
                          user1['name'],
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        ListTile(
                          leading: const Icon(Icons.email),
                          title: Text(user1['email']),
                        ),
                        ListTile(
                          leading: const Icon(Icons.location_on),
                          title: Text(latitude),
                        ),
                        ListTile(
                          leading: const Icon(Icons.location_on),
                          title: Text(longitude),
                        ),
                      ],
                    );
                  },
                );
              }
              ;
            }));
  }
}
