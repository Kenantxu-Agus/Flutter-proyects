import 'package:clima/models/weather_model.dart';
import 'package:flutter/material.dart';

import '../models/location_model.dart';
import '../services/location_service.dart';
import '../services/networking_service.dart';
import '../views/city_screen.dart';

class LocationViewModel {
  WeatherModel _weather;

  LocationViewModel(this._weather);

  String getTemp() {
    return _weather.temperature.toString();
  }

  String getCity() {
    return _weather.cityName;
  }

  String getWeatherIcon() {
    if (_weather.condition < 300) {
      return '🌩';
    } else if (_weather.condition < 400) {
      return '🌧';
    } else if (_weather.condition < 600) {
      return '☔️';
    } else if (_weather.condition < 700) {
      return '☃️';
    } else if (_weather.condition < 800) {
      return '🌫';
    } else if (_weather.condition == 800) {
      return '☀️';
    } else if (_weather.condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage() {
    if (_weather.temperature > 25.0) {
      return 'It\'s 🍦 time';
    } else if (_weather.temperature > 20.0) {
      return 'Time for shorts and 👕';
    } else if (_weather.temperature < 10.0) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }

  void setWeather(WeatherModel weather) => _weather = weather;

  Future<WeatherModel> cityButton(BuildContext context) async {
    return await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return CityScreen();
    }));
  }

  void positionUpdate() async {
    LocationModel position = await LocationService.getLocation();
    _weather = await NetworkService.getWeather(position);
  }
}
