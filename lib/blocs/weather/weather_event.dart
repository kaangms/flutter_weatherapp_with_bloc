import 'package:equatable/equatable.dart';

abstract class WeatherEvent extends Equatable {
  WeatherEvent(List<Object> list);

  @override
  List<Object> get props => [];
}

class FetchWeatherEvent extends WeatherEvent {
  final String cityName;
  FetchWeatherEvent({required this.cityName}) : super([cityName]);
}

class RefreshWeatherEvent extends WeatherEvent {
  final String cityName;
  RefreshWeatherEvent({required this.cityName}) : super([cityName]);
}
