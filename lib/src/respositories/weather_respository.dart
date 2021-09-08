import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:weather_app/src/models/weather_model.dart';

final locationUrl = (cityName) =>
    'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=APP_ID';

class WeatherRepository {
  Future<WeatherModel> getWeather(String cityName) async {
    final result = await http.get(Uri.parse(locationUrl(cityName)));
    if (result.statusCode != 200) {
      throw Exception();
    }
    return parsedJson(result.body);
  }

  WeatherModel parsedJson(final response) {
    final jsonDecoded = json.decode(response);
    final jsonWeather = jsonDecoded["main"];
    return WeatherModel.fromJson(jsonWeather);
  }
}
