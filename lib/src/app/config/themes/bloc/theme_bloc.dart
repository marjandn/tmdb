import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(LightThemeState()) {
    on<ThemeChangePressed>(
      (event, emit) {
        (state is LightThemeState) ? emit(DarkThemeState()) : emit(LightThemeState());
      },
    );
  }

  @override
  void onEvent(ThemeEvent event) {
    super.onEvent(event);
    print(event);
  }

  @override
  void onChange(Change<ThemeState> change) {
    super.onChange(change);
    print(change);
  }

  @override
  void onTransition(Transition<ThemeEvent, ThemeState> transition) {
    super.onTransition(transition);
    print(transition);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print('$error, $stackTrace');
    super.onError(error, stackTrace);
  }
}
