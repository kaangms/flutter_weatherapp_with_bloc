import 'package:bolum_33_flutter_weatherapp_with_bloc/locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/weather/bloc.dart';
import 'package:flutter/material.dart';

import 'blocs/weather/theme/theme_bloc.dart';
import 'blocs/weather/theme/theme_state.dart';
import 'widget/weather_app.dart';

void main() {
  setupLocator();
  runApp(BlocProvider(
    create: (context) =>
        ThemeBloc(AppThemeState(theme: ThemeData.light(), color: Colors.cyan)),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        debugPrint((state as AppThemeState).theme.toString());
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Weather App',
          theme: (state).theme,
          home: BlocProvider<WeatherBloc>(
            create: (context) => WeatherBloc(WeatherInitialState()),
            child: WeatherApp(),
          ),
        );
      },
    );
  }
}
