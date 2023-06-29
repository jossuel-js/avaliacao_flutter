import 'package:avaliacao/database/mongodb.dart';
import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart';

class LoginPage extends StatelessWidget {
  TextEditingController email_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        margin: EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _header(context),
              _inputField(context),
              _forgotPassword(context),
              _signup(context),
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
        Padding(padding: EdgeInsets.all(30))
      ],
    );
  }

  _inputField(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: email_controller,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              hintText: "Email",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none),
              fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
              filled: true,
              prefixIcon: Icon(Icons.person)),
        ),
        SizedBox(height: 10),
        TextField(
          controller: password_controller,
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
            hintText: "Senha",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none),
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
            prefixIcon: Icon(Icons.person),
          ),
          obscureText: true,
        ),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: () async {
            await MongoDb.loginUsuario(
                email_controller.text, password_controller.text);
          },
          child: Text(
            "Entrar",
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

  _forgotPassword(context) {
    return TextButton(
        onPressed: () {
          Navigator.pushNamed(context, '/forgot');
        },
        child: Text("Esqueceu a Senha?"));
  }

  _signup(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Nao possui uma conta? "),
        TextButton(
            onPressed: () async {
              //await MongoDb.registrarUsuario(
              //   'pedro', 'pedro@gmail.com', 'pedro', 123, 123);
              //await MongoDb.retornarTodosUsuarios();
              // await MongoDb.retornarUsuarioPeloId(ObjectId.fromHexString('649ccc6273dca0c3530aed36'));
              Navigator.pushNamed(context, '/homepage');
            },
            child: Text("Cadastrar-se"))
      ],
    );
  }
}
