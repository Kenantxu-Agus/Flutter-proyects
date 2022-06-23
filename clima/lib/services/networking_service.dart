import 'dart:convert';

import 'package:clima/models/weather_model.dart';
import 'package:http/http.dart' as http;

import '../models/location_model.dart';
import '../utilities/constants.dart';

class NetworkService {
  static Future<WeatherModel> getWeather(LocationModel position) async {
    String url =
        '${urlBaseWeather}lat=${position.latitude}&lon=${position.longitude}&appid=$apiKey&units=metric';
    print('accediendo a la url: $url');
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return WeatherModel.fromJson(jsonDecode(response.body));
    } else {
      print(response.statusCode);
    }
  }

  static Future<WeatherModel> cityWeather(String cityName) async {
    var url = '${urlBaseWeather}q=$cityName&appid=$apiKey&units=metric';
    print('accediendo a la url de la ciudad: $url');
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return WeatherModel.fromJson(jsonDecode(response.body));
    } else {
      print(response.statusCode);
    }
  }
}
