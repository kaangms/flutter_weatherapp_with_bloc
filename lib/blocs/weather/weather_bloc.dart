import 'package:bloc/bloc.dart';
import 'package:bolum_33_flutter_weatherapp_with_bloc/data/weather_repository.dart';
import 'package:bolum_33_flutter_weatherapp_with_bloc/locator.dart';
import 'package:bolum_33_flutter_weatherapp_with_bloc/models/weather/weather.dart';

import 'bloc.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository = locator<WeatherRepository>();

  WeatherBloc(WeatherState initialState) : super(initialState);

  @override
  WeatherState get initialState => WeatherInitialState();

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is FetchWeatherEvent) {
      yield WeatherLoadingState();

      try {
        var newWeather = await weatherRepository.getWeather(event.cityName);
        yield WeatherLoadedState(weather: newWeather);
      } catch (_) {
        print("----------" + _.toString());
        yield WeatherErrorState();
      }
    } else if (event is RefreshWeatherEvent) {
      try {
        var newWeather = await weatherRepository.getWeather(event.cityName);
        yield WeatherLoadedState(weather: newWeather);
        throw Exception();
      } catch (_) {
        print("----------" + state.toString());
        yield state;
      }
    }
  }
}
