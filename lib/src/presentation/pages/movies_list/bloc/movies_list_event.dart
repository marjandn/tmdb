part of 'movies_list_bloc.dart';

abstract class MoviesListEvent extends Equatable {
  const MoviesListEvent();

  @override
  List<Object> get props => [];
}

class PopularMoviesRequestedEvent extends MoviesListEvent {
  const PopularMoviesRequestedEvent();

  @override
  List<Object> get props => [];
}

class UpcomingMoviesRequestedEvent extends MoviesListEvent {
  const UpcomingMoviesRequestedEvent();

  @override
  List<Object> get props => [];
}
