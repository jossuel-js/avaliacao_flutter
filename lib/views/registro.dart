import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  TextEditingController email_controller = TextEditingController();
  TextEditingController password_controller= TextEditingController();
  TextEditingController latitude_controller= TextEditingController();
  TextEditingController longitude_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:SingleChildScrollView(child: 
         Container(
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
          keyboardType:TextInputType.emailAddress,
          decoration: InputDecoration(
              hintText: "Email",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none),
              fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
              filled: true,
              prefixIcon: const Icon(Icons.person)),
              controller: email_controller,
        ),
        const SizedBox(height: 10),
        TextField(
          keyboardType:TextInputType.visiblePassword,
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
        const SizedBox(height: 10),
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
          obscureText: true,
           controller: latitude_controller,
        ),
        const SizedBox(height: 10),
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
          obscureText: true,
           controller: longitude_controller,
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {Navigator.pushNamed(context, '/login');},
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          child: const Text(
            "Registro",
            style: TextStyle(fontSize: 20),
          ),
        )
      ],
    );
  }
}
