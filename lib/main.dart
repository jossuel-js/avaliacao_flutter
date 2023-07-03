import 'package:avaliacao/views/contacts.dart';
import 'package:avaliacao/views/forgot.dart';
import 'package:avaliacao/views/home.dart';
import 'package:avaliacao/views/insert_forgot.dart';

import 'package:avaliacao/views/lobby.dart';
import 'package:avaliacao/views/login.dart';
import 'package:avaliacao/views/mapa.dart';
import 'package:avaliacao/views/perfil.dart';
import 'package:avaliacao/views/registro.dart';
import 'package:avaliacao/views/weather.dart';
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
        body: WelcomePage(),
      ),
      routes: {
        '/homepage': (context) => MyHomePage(),
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/maps': (context) => MapScreen(),
        '/forgot': (context) => myforgotpage(title: 'forgot-password'),
        '/weather': (context) => WeatherPage(),
        '/profile': (context) => ProfileScreen(),
        '/insert_token': (context) => insertForgot(
              title: 'Insert Token forgot',
            ),
        '/contacts': (context) => ContactScreen(),
      },
    );
  }
}
