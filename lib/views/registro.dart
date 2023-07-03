import 'package:flutter/material.dart';

import '../database/mongodb.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController name_controller = TextEditingController();

  TextEditingController email_controller = TextEditingController();

  TextEditingController password_controller = TextEditingController();

  TextEditingController latitude_controller = TextEditingController();

  TextEditingController longitude_controller = TextEditingController();

  _errorMsg(BuildContext context) {
    return const AlertDialog(
      title: Text('Erro no registro'),
      content: Text('Tente novamente'),
    );
  }

  _errorMsg2(BuildContext context) {
    return const AlertDialog(
      title: Text("Erro no formulário"),
      content: Text("Verifique se algum campo está vazio e tente novamente"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(24),
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
              prefixIcon: const Icon(Icons.person)),
          controller: name_controller,
        ),
        const SizedBox(height: 10),
        TextField(
          keyboardType: TextInputType.emailAddress,
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
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
            hintText: "Senha",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none),
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
            prefixIcon: const Icon(Icons.password),
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
            prefixIcon: const Icon(Icons.location_on),
          ),
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
            prefixIcon: const Icon(Icons.location_on),
          ),
          controller: longitude_controller,
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () async {
            bool validacao = true;
            if(name_controller.text.isEmpty){
              validacao = false;
            }
            if(email_controller.text.isEmpty){
              validacao = false;
            }
            if(password_controller.text.isEmpty){
              validacao = false;
            }
            if(latitude_controller.text.isEmpty){
              validacao = false;
            }
            if(longitude_controller.text.isEmpty){
              validacao = false;
            }

            if (validacao == false) {
              await showDialog(
                  context: context,
                  builder: (BuildContext context) => _errorMsg2(context));
            } else {

              final id = await MongoDb.registrarUsuario(
                name_controller.text,
                email_controller.text,
                password_controller.text,
                latitude_controller.text,
                longitude_controller.text);

              if (id != null) {
                Navigator.pushNamed(context, '/login');
              } else {
                await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return _errorMsg(context);
                    });
              }
            }
          },
          child: const Text(
            "Registro",
            style: TextStyle(fontSize: 20),
          ),
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
        )
      ],
    );
  }
}
