import 'dart:async';

import 'package:bolum_33_flutter_weatherapp_with_bloc/blocs/weather/bloc.dart';
import 'package:bolum_33_flutter_weatherapp_with_bloc/blocs/weather/theme/index.dart';
import 'package:bolum_33_flutter_weatherapp_with_bloc/blocs/weather/theme/theme_bloc.dart';
import 'package:bolum_33_flutter_weatherapp_with_bloc/widget/trans_background_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'last_update.dart';
import 'location.dart';
import 'select_city.dart';
import 'temperature_range.dart';
import 'weather_image.dart';

// ignore: must_be_immutable
class WeatherApp extends StatelessWidget {
  WeatherApp({Key? key}) : super(key: key);
  String selectCityText = 'Ankara';
  Completer<void> _refreshCompleter = Completer<void>();

  @override
  Widget build(BuildContext context) {
    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        actions: [
          IconButton(
              onPressed: () async {
                selectCityText = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SelectCity()));
                debugPrint("Seçilen Şehir: " + selectCityText);
                if (selectCityText != null) {
                  _weatherBloc.add(FetchWeatherEvent(cityName: selectCityText));
                }
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: Center(
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state is WeatherInitialState) {
              // debugPrint("WeatherInitialState");
              return Center(
                child: Text("Şehir Seçiniz"),
              );
            }
            if (state is WeatherLoadingState) {
              //debugPrint("WeatherLoadingState");
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is WeatherLoadedState) {
              //debugPrint("WeatherLoadedState");
              final getWeather = state.weather;
              var _weatherStateAbbr =
                  getWeather.consolidatedWeather![0].weatherStateAbbr!;
              // debugPrint("_weatherStateAbbr: " + _weatherStateAbbr);
              BlocProvider.of<ThemeBloc>(context)
                  .add(ChangeThemeEvent(weatherStateAbbr: _weatherStateAbbr));

              _refreshCompleter.complete();
              _refreshCompleter = Completer();
              // getWeather.consolidatedWeather[0];
              return BlocBuilder<ThemeBloc, ThemeState>(
                builder: (context, state) {
                  return TransBackgroundColor(
                    color: (state as AppThemeState).color,
                    child: RefreshIndicator(
                      onRefresh: () async {
                        _weatherBloc.add(RefreshWeatherEvent(
                            cityName: getWeather.title.toString()));
                        return await _refreshCompleter.future;
                      },
                      child: ListView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                                child: LocationWidget(
                              selectCity: getWeather.title.toString(),
                            )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(child: LastUpdateWidget()),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(child: WeatherImageWidget()),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(child: TemperatureRange()),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            if (state is WeatherErrorState) {
              // debugPrint("WeatherErrorState");
              return Center(
                child: Text("hata oluştu"),
              );
            } else {
              // debugPrint("WeatherErrorState-else");
              return Center(
                child: Text("hata oluştu"),
              );
            }
          },
        ),
      ),
    );
  }
}
