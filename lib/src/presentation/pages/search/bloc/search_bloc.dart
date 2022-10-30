import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tmdb_prj/src/app/constants/constants.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchTypes currentSearchTypeItemSelected = SearchTypes.movie;

  SearchBloc() : super(SearchInitial()) {
    on<SearchTopTabbarItemSelectedEvent>((event, emit) {
      currentSearchTypeItemSelected = event.searchTypes;
      emit(SearchTopTabbarItemSelected(searchTypes: currentSearchTypeItemSelected));
    });
  }
}
