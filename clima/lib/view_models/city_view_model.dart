import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/weather_model.dart';
import '../services/networking_service.dart';

class CityViewModel {
  WeatherModel _weather;
  String _cityName;
  CityViewModel(this._cityName);

  void getCityWeather(BuildContext context) async {
    print(_cityName);
    _weather = await NetworkService.cityWeather(_cityName);
    print(_weather);
    Navigator.pop(context, _weather);
  }

  void setCityName(String cityName) {
    _cityName = cityName;
  }

  String getCityName() {
    return _cityName;
  }
}
