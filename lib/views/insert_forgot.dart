
import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';

class insertForgot extends StatefulWidget {
  const insertForgot({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<insertForgot> createState() => _insertForgotState();

}
  TextEditingController forgot_controller = TextEditingController();

class _insertForgotState extends State<insertForgot>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: Container(
          child: Form(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Insira seu codigo',
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      labelText: 'Email',
                      icon: Icon(
                        Icons.mail,
                        color: Colors.black,
                      ),
                      errorStyle: TextStyle(color: Colors.black),
                      labelStyle: TextStyle(color: Colors.black),
                      hintStyle: TextStyle(color: Colors.black),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    controller:forgot_controller,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Insira nova senha',
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      labelText: 'senha',
                      icon: Icon(
                        Icons.password,
                        color: Colors.black,
                      ),
                      errorStyle: TextStyle(color: Colors.black),
                      labelStyle: TextStyle(color: Colors.black),
                      hintStyle: TextStyle(color: Colors.black),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    controller:forgot_controller,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    child: Text('Enviar'),
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.black, 
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
