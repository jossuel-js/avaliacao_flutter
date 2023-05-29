// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';


import 'home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: const MyStatefulWidget(),
      ),
      
      routes: {
        '/homepage': (context) => MyHomePage('homepage'),
      },
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
 



  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Center(
        child: ListView(
      padding: const EdgeInsets.all(10),
      children: <Widget>[
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset('assets/images/ifpi.jpg'),
            ],
          ),
        ),
        Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: const Text(
              'Sign in',
              style: TextStyle(fontSize: 20),
            )),
        Container(
          padding: const EdgeInsets.all(10),
          child: TextField(
            controller: nameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'User Name',
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: TextField(
            obscureText: true,
            controller: passwordController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            //forgot password screen
          },
          child: const Text(
            'Forgot Password',
          ),
        ),
        Container(
            height: 50,
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, '/homepage');
                
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 44, 184, 96),
                  // ignore: prefer_const_constructors
                  foregroundColor: Color.fromARGB(255, 0, 0, 0)),
              child: const Text('Login'),
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Does not have account?'),
            TextButton(
              child: const Text(
                'Sign in',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                //signup screen
              },
            )
          ],
        ),
      ],
    ));
  }
}
