part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchTopTabbarItemSelected extends SearchState {
  final SearchTypes searchTypes;
  const SearchTopTabbarItemSelected({required this.searchTypes});

  @override
  List<Object> get props => [searchTypes];
}

class DataFetchFailedState extends SearchState {
  const DataFetchFailedState();
}

class MoviesFetchSuccessState extends SearchState {
  final List<Movie> movies;
  final bool showLazyLoading;
  const MoviesFetchSuccessState({required this.movies, required this.showLazyLoading});

  @override
  List<Object> get props => [movies, showLazyLoading];
}

class TvshowsFetchSuccessState extends SearchState {
  final List<TvShow> tvshows;
  final bool showLazyLoading;
  const TvshowsFetchSuccessState({required this.tvshows, required this.showLazyLoading});

  @override
  List<Object> get props => [tvshows, showLazyLoading];
}

class PeopleFetchSuccessState extends SearchState {
  final List<People> people;
  final bool showLazyLoading;
  const PeopleFetchSuccessState({required this.people, required this.showLazyLoading});

  @override
  List<Object> get props => [people, showLazyLoading];
}

class CenterLoadingStateState extends SearchState {
  const CenterLoadingStateState();
}
