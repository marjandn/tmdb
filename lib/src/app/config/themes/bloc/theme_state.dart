part of 'theme_bloc.dart';

abstract class ThemeState extends Equatable {
  const ThemeState();

  @override
  List<Object?> get props => [];
}

class LightThemeState extends ThemeState {}

class DarkThemeState extends ThemeState {}

class ThemeChanged extends ThemeState {}
