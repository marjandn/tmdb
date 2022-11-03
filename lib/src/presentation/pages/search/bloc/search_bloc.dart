import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:tmdb_prj/src/app/constants/constants.dart';
import 'package:tmdb_prj/src/app/errors/failure.dart';
import 'package:tmdb_prj/src/domain/entities/movie.dart';
import 'package:tmdb_prj/src/domain/entities/people.dart';
import 'package:tmdb_prj/src/domain/entities/tvshow.dart';
import 'package:tmdb_prj/src/domain/usecases/movie/search_movie.dart';
import 'package:tmdb_prj/src/domain/usecases/people/search_people.dart';
import 'package:tmdb_prj/src/domain/usecases/tvshow/search_tvshow.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchTypes currentSearchTypeItemSelected = SearchTypes.movie;

  final SearchMovie searchMovie;
  final SearchTvshow searchTvshow;
  final SearchPeople searchPeople;

  int _currentPage = 0;
  int _totalPage = 1;

  dispose() {
    _totalPage = 1;
    _currentPage = 0;
  }

  SearchBloc({required this.searchMovie, required this.searchTvshow, required this.searchPeople})
      : super(SearchInitial()) {
    on<SearchTopTabbarItemSelectedEvent>((event, emit) {
      dispose();
      currentSearchTypeItemSelected = event.searchTypes;
      emit(SearchTopTabbarItemSelected(searchTypes: currentSearchTypeItemSelected));
    });

    on<MovieSeachRequestedEvent>(
      (event, emit) async {
        print("We are in MovieSearch Event");
        if (_currentPage == 0) emit(const CenterLoadingStateState());
        if (event.query.isNotEmpty) {
          if (!_showLazyLoading()) return;
          Either<Failur, List<Movie>> movies =
              await searchMovie.call(SearchParams(query: event.query, page: ++_currentPage));

          movies.fold((left) => emit(const DataFetchFailedState()), (right) {
            _totalPage = right.first.totalPage ?? 1;
            emit(MoviesFetchSuccessState(movies: right, showLazyLoading: _showLazyLoading()));
          });
        }
      },
    );

    on<TvShowSeachRequestedEvent>(
      (event, emit) async {
        print("We are in TvShowSearch Event");
        if (_currentPage == 0) emit(const CenterLoadingStateState());
        if (event.query.isNotEmpty) {
          if (!_showLazyLoading()) return;

          Either<Failur, List<TvShow>> movies =
              await searchTvshow.call(SearchParams(query: event.query, page: ++_currentPage));

          movies.fold((left) => emit(const DataFetchFailedState()), (right) {
            _totalPage = right.first.totalPage ?? 1;
            emit(TvshowsFetchSuccessState(tvshows: right, showLazyLoading: _showLazyLoading()));
          });
        }
      },
    );

    on<PeopleSeachRequestedEvent>(
      (event, emit) async {
        print("We are in PeopleSearch Event");
        if (_currentPage == 0) emit(const CenterLoadingStateState());
        if (event.query.isNotEmpty) {
          if (!_showLazyLoading()) return;

          Either<Failur, List<People>> people =
              await searchPeople.call(SearchParams(query: event.query, page: ++_currentPage));

          people.fold((left) => emit(const DataFetchFailedState()), (right) {
            _totalPage = right.first.totalPages ?? 1;
            emit(PeopleFetchSuccessState(people: right, showLazyLoading: _showLazyLoading()));
          });
        }
      },
    );
  }

  bool _showLazyLoading() => _currentPage < _totalPage;
}
