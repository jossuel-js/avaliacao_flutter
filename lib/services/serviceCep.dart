import 'dart:convert';

import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> buscarCEP(String cep) async {
  final url = 'https://viacep.com.br/ws/$cep/json/';
  final response = await http.get(Uri.parse(url));
  final body = json.decode(response.body);

  if (response.statusCode == 200) {
    return body;
  } else {
    throw Exception('Falha ao buscar o CEP.');
  }
}
