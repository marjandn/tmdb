part of 'movies_list_bloc.dart';

abstract class MoviesListEvent extends Equatable {
  const MoviesListEvent();

  @override
  List<Object> get props => [];
}

class PopularMoviesRequestedEvent extends MoviesListEvent {
  final int page;
  const PopularMoviesRequestedEvent({required this.page});

  @override
  List<Object> get props => [page];
}

class UpcomingMoviesRequestedEvent extends MoviesListEvent {
  final int page;
  const UpcomingMoviesRequestedEvent({required this.page});

  @override
  List<Object> get props => [page];
}
