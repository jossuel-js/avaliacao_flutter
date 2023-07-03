import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../database/mongodb.dart';

class LoginPage extends StatelessWidget {
  TextEditingController email_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();

  _errorMsg(BuildContext context) {
    return const AlertDialog(
      title: Text('Erro no login'),
      content: Text('Verifique sua senha e email'),
    );
  }

  _errorMsg2(BuildContext context) {
    return const AlertDialog(
      title: Text("Erro no login"),
      content: Text("Verifique se algum campo está vazio e tente novamente"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        margin: const EdgeInsets.all(24),
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
        const Padding(padding: EdgeInsets.all(30))
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
              prefixIcon: const Icon(Icons.person)),
        ),
        const SizedBox(height: 10),
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
            prefixIcon: const Icon(Icons.person),
          ),
          obscureText: true,
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () async {
            bool validacao = true;
            if (email_controller.text.isEmpty) {
              validacao = false;
            }
            if (password_controller.text.isEmpty) {
              validacao = false;
            }

            if (validacao == false) {
              await showDialog(
                  context: context,
                  builder: (BuildContext context) => _errorMsg2(context));
            } else {
              final id = await MongoDb.loginUsuario(
                  email_controller.text, password_controller.text);
              if (id == null) {
                await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return _errorMsg(context);
                    });
              } else {
                Navigator.pushNamed(context, '/homepage');
              }
            }
          },
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          child: const Text(
            "Entrar",
            style: TextStyle(fontSize: 20),
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
        child: const Text("Esqueceu a Senha?"));
  }

  _signup(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Nao possui uma conta? "),
        TextButton(
            onPressed: () async {
              Navigator.pushNamed(context, '/register');
            },
            child: const Text("Cadastrar-se"))
      ],
    );
  }
}
