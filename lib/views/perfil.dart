import 'package:flutter/material.dart';
import 'package:avaliacao/globals.dart' as globals;

class ProfileScreen extends StatelessWidget {

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage('assets/profile_image.jpg'),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Pedro Baruch',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Progamador FullStack',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 16.0),
                 
                ],
              ),
            ),
            SizedBox(height: 16.0),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('baruch1@example.com'),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('(086) 9 9999-9999'),
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Teresina, Pi'),
            ),
          ],
        ),
      ),
    );
  }
}
