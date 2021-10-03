import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'index.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc(ThemeState initialState)
      : super(AppThemeState(theme: ThemeData.light(), color: Colors.blue));
  @override
  ThemeState get initialState =>
      AppThemeState(theme: ThemeData.light(), color: Colors.blue);
  @override
  Stream<ThemeState> mapEventToState(ThemeEvent event) async* {
    ThemeState themeState =
        AppThemeState(theme: ThemeData.light(), color: Colors.blue);

    if (event is ChangeThemeEvent) {
      switch (event.weatherStateAbbr) {
        case "sn": //karlı
        case "sl": //sulu kar
        case "h": //dolu
        case "t": //fırtına
        case "hc": //çok bulutlu
          themeState = AppThemeState(
              theme: ThemeData(primaryColor: Colors.blueGrey),
              color: Colors.grey);
          break;

        case "hr": //ağır yagmurlu
        case "lr": //hafif yagmurlu
        case "s": // sağanak yagıs
          themeState = AppThemeState(
              theme: ThemeData(primaryColor: Colors.indigoAccent),
              color: Colors.indigo);
          break;

        case "lc": //az bulutlu
        case "c": //açık güneşli hava
          themeState = AppThemeState(
              theme: ThemeData(primaryColor: Colors.orangeAccent),
              color: Colors.yellow);
          break;
        default:
          AppThemeState(theme: ThemeData.light(), color: Colors.blue);
      }
      yield themeState;
    }
  }
}
