import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {
  final String apiKey = 'e6557f638544bfcdb85be4383261d48e'; 

  Future<Map<String, dynamic>> getWeatherData(String city) async {
    final String apiUrl =
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey';

    final http.Response response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Falha ao obter dados do clima');
    }
  }
}