import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ThemeState extends Equatable {
  const ThemeState();
}

class ThemeInitial extends ThemeState {
  @override
  List<Object> get props => [];
}

class AppThemeState extends ThemeState {
  final ThemeData theme;
  final MaterialColor color;

  AppThemeState({required this.theme, required this.color});

  @override
  // TODO: implement props
  List<Object> get props => [theme, color];
}
