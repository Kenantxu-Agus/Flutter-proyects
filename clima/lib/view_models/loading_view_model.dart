import 'package:clima/view_models/location_view_model.dart';
import 'package:flutter/material.dart';

import '../models/location_model.dart';
import '../models/weather_model.dart';
import '../services/location_service.dart';
import '../services/networking_service.dart';
import '../views/location_screen.dart';

class LoadingViewModel {
  WeatherModel _weather;

  void localizeUserAndGetWeather(BuildContext context) async {
    LocationModel position = await LocationService.getLocation();
    _weather = await NetworkService.getWeather(position);
    _goToLocationView(context);
  }

  void _goToLocationView(BuildContext context) async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        LocationViewModel viewModel = LocationViewModel(_weather);
        LocationScreen view = LocationScreen(viewModel);
        return view;
      }),
    );
  }
}
