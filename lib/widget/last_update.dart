import '/blocs/weather/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LastUpdateWidget extends StatelessWidget {
  LastUpdateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
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
          final getWeatherTime = state.weather.time!.toLocal();
          // getWeather.consolidatedWeather[0];
          return Text(
            "Son Güncelleme  " +
                TimeOfDay.fromDateTime(getWeatherTime).format(context),
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
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
    );
  }
}
