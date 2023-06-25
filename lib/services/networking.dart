import 'dart:convert';

import 'package:http/http.dart' as http;

class WeatherApi {

  WeatherApi(this.url);

  final String url;

  Future<dynamic> getWeatherData() async{
    Uri uri = Uri.parse(url);
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);

    } else {
      throw Exception('Fehler beim Laden der Wetterdaten');
    }
  }
}