import 'package:flutter/material.dart';

import '../models/weather_model.dart';





class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final Map<String, String> weatherTranslations = {
    'clear sky': 'céu limpo',
    'few clouds': 'algumas nuvens',
    'scattered clouds': 'nuvens dispersas',
    'broken clouds': 'nuvens quebradas',
    'shower rain': 'chuva fraca',
    'rain': 'chuva',
    'thunderstorm': 'trovoada',
    'snow': 'neve',
    'mist': 'névoa',
  };
  WeatherService _weatherService = WeatherService();
  String _city = '';
  Map<String, dynamic>? _weatherData;

  void _getWeatherData() async {
    try {
      final weatherData = await _weatherService.getWeatherData(_city);
      setState(() {
        _weatherData = weatherData;
      });
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Erro'),
          content: Text('Falha ao obter dados do clima.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Previsão do Tempo'),
          leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => _voltarPagina(context),
        ),
        ),
        body: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      _city = value;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Digite o nome da cidade',
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: _getWeatherData,
                child: Text('Obter Clima'),
              ),
              if (_weatherData != null)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        'Cidade: ${_weatherData!['name']}',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'Temperatura: ${_convertToCelsius(_weatherData!['main']['temp']).toStringAsFixed(2)}°C',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'Descrição: ${weatherTranslations[_weatherData!['weather'][0]['description']]}',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ));
  }

  double _convertToCelsius(double kelvin) {
    return kelvin - 273.15;
  }
}
 void _voltarPagina(BuildContext context) {
    Navigator.of(context).pushNamed("/homepage");
  }