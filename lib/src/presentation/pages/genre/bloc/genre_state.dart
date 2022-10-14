part of 'genre_bloc.dart';

abstract class GenreState extends Equatable {
  const GenreState();

  @override
  List<Object> get props => [];
}

class GenreTabSelectionState extends GenreState {
  final int selectionTabIndex;

  const GenreTabSelectionState({required this.selectionTabIndex});

  @override
  List<Object> get props => [selectionTabIndex];
}

class SpecificGenreSelectionState extends GenreState {
  final int selectedGenreId;

  const SpecificGenreSelectionState({required this.selectedGenreId});

  @override
  List<Object> get props => [selectedGenreId];
}

class GenresDataLoading extends GenreState {
  const GenresDataLoading();
}

class GenresDataFaile extends GenreState {
  const GenresDataFaile();
}

class GenresDataSuccess extends GenreState {
  final Genre genres;
  const GenresDataSuccess({required this.genres});
}

class MoviesDataLoading extends GenreState {
  const MoviesDataLoading();
}

class MoviesDataFailed extends GenreState {
  const MoviesDataFailed();
}

class MoviesDataSuccess extends GenreState {
  const MoviesDataSuccess();
}
