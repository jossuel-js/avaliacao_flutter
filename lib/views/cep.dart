import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CepApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CEP App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CepPage(),
    );
  }
}

class CepPage extends StatefulWidget {
  @override
  _CepPageState createState() => _CepPageState();
}

class _CepPageState extends State<CepPage> {
  final TextEditingController _cepController = TextEditingController();
  String _result = '';

  Future<void> _fetchAddress(String cep) async {
    final response =
        await http.get(Uri.parse('https://viacep.com.br/ws/$cep/json/'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        _result = '''
          CEP: ${data['cep']}
          Logradouro: ${data['logradouro']}
          Bairro: ${data['bairro']}
          Cidade: ${data['localidade']}
          Estado: ${data['uf']}
        ''';
      });
    } else {
      setState(() {
        _result = 'Erro ao buscar o endereço. Tente novamente.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CEP App'),
        centerTitle: true,
        backgroundColor:Colors.black,
      ),
     body: Container(
          decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/vsm_roadmap.jpg"),
            fit: BoxFit.cover,
          )),
          child: Form(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Enter Your Postal-Code',
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  ),
                  TextFormField(
                    controller: _cepController,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      labelText: 'Cep',
                      icon: Icon(
                        Icons.location_on_outlined,
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
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    child: Text('Send'),
                    onPressed: () {_fetchAddress(_cepController.text);},
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.black, // Background Color
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(_result)
                ],
              ),
            ),
          ),
                
    ));
  }
}
