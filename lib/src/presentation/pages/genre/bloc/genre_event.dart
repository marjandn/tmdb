part of 'genre_bloc.dart';

abstract class GenreEvent extends Equatable {
  const GenreEvent();

  @override
  List<Object> get props => [];
}

class TabItemSelected extends GenreEvent {
  final int tabItemIndex;

  const TabItemSelected({required this.tabItemIndex});

  @override
  List<Object> get props => [tabItemIndex];
}

class GenreItemSelected extends GenreEvent {
  final int genreId;

  const GenreItemSelected({required this.genreId});

  @override
  List<Object> get props => [genreId];
}
