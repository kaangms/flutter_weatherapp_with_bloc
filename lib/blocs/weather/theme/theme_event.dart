import 'package:equatable/equatable.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class ChangeThemeEvent extends ThemeEvent {
  final String weatherStateAbbr;

  ChangeThemeEvent({required this.weatherStateAbbr});
}
