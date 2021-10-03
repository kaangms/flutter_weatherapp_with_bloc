import '/models/weather/weather.dart';
import 'package:equatable/equatable.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();
}

class WeatherInitialState extends WeatherState {
  @override
  List<Object> get props => [];
}

class WeatherLoadingState extends WeatherState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class WeatherLoadedState extends WeatherState {
  Weather weather;
  WeatherLoadedState({required this.weather});

  @override
  // TODO: implement props
  List<Object> get props => [weather];
}

class WeatherErrorState extends WeatherState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}
