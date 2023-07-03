import 'package:http/http.dart' as http;
import 'dart:convert';

class userService {

  Future<Map<String, dynamic>> getUsers() async {
    final url = 'backendengsoft2023-1-production.up.railway.app/auth/all-users';
    final response = await http.get(Uri.parse(url));
    final body = json.decode(response.body);

    print(body);
    if (response.statusCode == 200) {
      return body.users;
    } else {
      throw Exception('Falha ao buscar os usurários.');
    }
  }
}
