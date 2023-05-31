
import 'package:avaliacao/views/home.dart';

import 'package:avaliacao/views/lobby.dart';
import 'package:avaliacao/views/login.dart';
import 'package:avaliacao/views/mapa.dart';
import 'package:avaliacao/views/registro.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body:WelcomePage(),
      ),
      
      routes: {
        '/homepage': (context) => MyHomePage('homepage'),
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/maps': (context) => MapSample(),

      },
    );
  }
}