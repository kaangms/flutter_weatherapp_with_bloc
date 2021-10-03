import '/blocs/weather/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherImageWidget extends StatelessWidget {
  const WeatherImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _getweather = BlocProvider.of<WeatherBloc>(context);
    return BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) => Column(
              children: [
                Text(
                  (state as WeatherLoadedState)
                          .weather
                          .consolidatedWeather![0]
                          .theTemp!
                          .floor()
                          .roundToDouble()
                          .toString() +
                      "°C",
                  style: TextStyle(fontSize: 30),
                ),
                Image.network(
                  'https://www.metaweather.com/static/img/weather/png/' +
                      state.weather.consolidatedWeather![0].weatherStateAbbr! +
                      ".png",
                  width: 150,
                  height: 150,
                ),
              ],
            ));
  }
}
