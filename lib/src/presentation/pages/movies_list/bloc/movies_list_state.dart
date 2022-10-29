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

  const MoviesFetchSuccessState({required this.movies});

  @override
  List<Object> get props => [movies];
}