part of 'movies_list_bloc.dart';

abstract class MoviesListState extends Equatable {
  const MoviesListState();

  @override
  List<Object> get props => [];
}

class MoviesListInitial extends MoviesListState {}

class MoviesFetchLoadingState extends MoviesListState {
  const MoviesFetchLoadingState();
}

class MoviesFetchFailedState extends MoviesListState {
  const MoviesFetchFailedState();
}

class MoviesFetchSuccessState extends MoviesListState {
  final List<Movie> movies;
  final bool showLazyLoading;

  const MoviesFetchSuccessState({required this.movies, required this.showLazyLoading});

  @override
  List<Object> get props => [movies, showLazyLoading];
}
