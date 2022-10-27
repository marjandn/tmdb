part of 'genre_bloc.dart';

abstract class GenreState extends Equatable {
  const GenreState();

  @override
  List<Object> get props => [];
}

class GenreInitial extends GenreState {}

// * Top Tabbar Movie-TvShow
class MovieTabItemSelectedState extends GenreState {
  const MovieTabItemSelectedState();
}

class TvShowTabItemSelectedState extends GenreState {
  const TvShowTabItemSelectedState();
}

// * Genres horizontal list
class SpecificGenreItemSelectedState extends GenreState {
  final Genre genre;
  const SpecificGenreItemSelectedState({required this.genre});

  @override
  List<Object> get props => [genre];
}

class GenresListFetchLoadingState extends GenreState {
  const GenresListFetchLoadingState();
}

class GenresListFetchFailedState extends GenreState {
  final String message;
  const GenresListFetchFailedState({required this.message});

  @override
  List<Object> get props => [message];
}

class GenresListFetchSuccessState extends GenreState {
  final List<Genre> genres;
  const GenresListFetchSuccessState({required this.genres});

  @override
  List<Object> get props => [genres];
}

// * Movies-TvShows list
class BodyListFetchLoading extends GenreState {
  const BodyListFetchLoading();
}

class BodyListFatchFaildState extends GenreState {
  const BodyListFatchFaildState();
}

class MoviesListFetchSuccessState extends GenreState {
  const MoviesListFetchSuccessState();
}

class TvShowsListFetchSuccessState extends GenreState {
  const TvShowsListFetchSuccessState();
}
