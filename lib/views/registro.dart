import 'package:flutter/material.dart';

import '../database/mongodb.dart';

class RegisterPage extends StatelessWidget {
  TextEditingController name_controller = TextEditingController();
  TextEditingController email_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();
  TextEditingController latitude_controller = TextEditingController();
  TextEditingController longitude_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _header(context),
              _inputField(context),
            ],
          ),
        ),
      ),
    ));
  }

  _header(context) {
    return Column(
      children: [
        Image.asset('assets/images/ifpi.jpg'),
      ],
    );
  }

  _inputField(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
              hintText: "Nome",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none),
              fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
              filled: true,
              prefixIcon: Icon(Icons.person)),
          controller: name_controller,
        ),
        SizedBox(height: 10),
        TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              hintText: "Email",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none),
              fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
              filled: true,
              prefixIcon: Icon(Icons.person)),
          controller: email_controller,
        ),
        SizedBox(height: 10),
        TextField(
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
            hintText: "Senha",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none),
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
            prefixIcon: Icon(Icons.password),
          ),
          obscureText: true,
          controller: password_controller,
        ),
        SizedBox(height: 10),
        TextField(
          decoration: InputDecoration(
            hintText: "latitude",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none),
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
            prefixIcon: Icon(Icons.location_on),
          ),
          
          controller: latitude_controller,
        ),
        SizedBox(height: 10),
        TextField(
          decoration: InputDecoration(
            hintText: "longitude",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none),
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
            prefixIcon: Icon(Icons.location_on),
          ),
          
          controller: longitude_controller,
        ),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: () async {
            await MongoDb.registrarUsuario(name_controller.text, email_controller.text,password_controller.text,latitude_controller.text,longitude_controller.text);
            Navigator.pushNamed(context, '/login');
          },
          child: Text(
            "Registro",
            style: TextStyle(fontSize: 20),
          ),
          style: ElevatedButton.styleFrom(
            shape: StadiumBorder(),
            padding: EdgeInsets.symmetric(vertical: 16),
          ),
        )
      ],
    );
  }
}
