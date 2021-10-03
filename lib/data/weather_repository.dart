import 'dart:developer';

import 'package:bolum_33_flutter_weatherapp_with_bloc/models/weather/weather.dart';

import '../locator.dart';
import 'weather_api_client.dart';

class WeatherRepository {
  WeatherApiClient weatherApiClient = locator<WeatherApiClient>();

  Future<Weather> getWeather(String city) async {
    final int cityId = await weatherApiClient.getLocationID(city);
    return await weatherApiClient.getWeather(cityId);
  }
}
