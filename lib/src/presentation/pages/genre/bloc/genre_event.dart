part of 'genre_bloc.dart';

abstract class GenreEvent extends Equatable {
  const GenreEvent();

  @override
  List<Object> get props => [];
}

class TopTabbarItemTappedEvent extends GenreEvent {
  final GenreParentItems genreParentItems;
  const TopTabbarItemTappedEvent({required this.genreParentItems});

  @override
  List<Object> get props => [genreParentItems];
}

class GenreItemTappedEvent extends GenreEvent {
  final Genre genre;
  const GenreItemTappedEvent({required this.genre});

  @override
  List<Object> get props => [genre];
}

class MovieItemTappedEvent extends GenreEvent {
  final Movie movie;
  const MovieItemTappedEvent({required this.movie});

  @override
  List<Object> get props => [movie];
}

class TvShowItemTappedEvent extends GenreEvent {
  final TvShow tvShow;
  const TvShowItemTappedEvent({required this.tvShow});
}
