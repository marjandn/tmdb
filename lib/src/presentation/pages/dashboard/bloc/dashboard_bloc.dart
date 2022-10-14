import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'dashboard_state.dart';
part 'dashboard_event.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  int currentBottomItemIndex = 0;

  DashboardBloc() : super(HomeSelectedState()) {
    on<BottomNavigationItemSelect>(
      (event, emit) {
        currentBottomItemIndex = event.itemIndex;
        switch (event.itemIndex) {
          case 1:
            emit(GenreSelectedState());
            break;
          case 2:
            emit(SearchSelectedState());
            break;
          default:
            emit(HomeSelectedState());
            break;
        }
      },
    );
  }
}
