import 'dart:developer';

import 'package:flutter/material.dart';

import '/models/weather/weather.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherApiClient {
  static const baseUrl = "https://www.metaweather.com";
  final http.Client httpClient = http.Client();

  Future<int> getLocationID(String cityName) async {
    final url = baseUrl + "/api/location/search/?query=" + cityName;
    final result = await httpClient.get(Uri.parse(url));
    if (result.statusCode != 200) {
      throw Exception("Veri Getirilemedi");
    }

    final gelenCevapJSON = (jsonDecode(result.body)) as List;
    return gelenCevapJSON[0]["woeid"];
  }

  Future<Weather> getWeather(int cityId) async {
    Map<String, String> reqHeaders = {
      "Content-type": "application/json",
      "charset": "utf-8"

      // "key": "xxxxx",
      // "token": "xxxxx",
      // "anunciante_name": "name",
      // "anunciante_pass": "password",
      // "anunciante_email": 'email'
    };
    final url = baseUrl + "/api/location/$cityId";

    final result = await httpClient.get(Uri.parse(url), headers: reqHeaders);
    if (result.statusCode != 200) {
      throw Exception("Hava durumu Getirilemedi");
    }
    final jsonResult = jsonDecode(
        utf8.decode(result.bodyBytes)); //Türkçe karekter sorunu çözümü
    // debugPrint(jsonResult.toString());
    return Weather.fromJson(jsonResult);
  }
}
