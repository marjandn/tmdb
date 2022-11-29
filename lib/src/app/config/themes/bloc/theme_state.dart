part of 'theme_bloc.dart';

abstract class ThemeState extends Equatable {
  const ThemeState();

  @override
  List<Object?> get props => [];
}

class LightThemeState extends ThemeState {
  const LightThemeState();
}

class DarkThemeState extends ThemeState {
  const DarkThemeState();
}

class ThemeChanged extends ThemeState {}
