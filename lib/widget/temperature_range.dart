import '/blocs/weather/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TemperatureRange extends StatelessWidget {
  const TemperatureRange({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        return BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Maks Sıcaklık : " +
                      (state as WeatherLoadedState)
                          .weather
                          .consolidatedWeather![0]
                          .maxTemp!
                          .toStringAsFixed(2)
                          .toString() +
                      "°C",
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  "Min Sıcaklık : " +
                      (state as WeatherLoadedState)
                          .weather
                          .consolidatedWeather![0]
                          .minTemp!
                          .toStringAsFixed(2)
                          .toString() +
                      "°C",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
