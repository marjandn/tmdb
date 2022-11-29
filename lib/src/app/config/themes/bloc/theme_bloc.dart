import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const LightThemeState()) {
    on<ThemeChangePressedEvent>(
      (event, emit) {
        (state is LightThemeState) ? emit(const DarkThemeState()) : emit(const LightThemeState());
      },
    );
  }
}
