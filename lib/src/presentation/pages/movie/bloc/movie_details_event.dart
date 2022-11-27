part of 'movie_details_bloc.dart';

abstract class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();

  @override
  List<Object> get props => [];
}

class MoviePrimaryDetailsRequestEvent extends MovieDetailsEvent {
  final int movieId;
  const MoviePrimaryDetailsRequestEvent(this.movieId);

  @override
  List<Object> get props => [movieId];
}

class MoviePicturesRequestEvent extends MovieDetailsEvent {
  final int movieId;
  const MoviePicturesRequestEvent(this.movieId);

  @override
  List<Object> get props => [movieId];
}

class MovieCreditsRequestEvent extends MovieDetailsEvent {
  final int movieId;
  const MovieCreditsRequestEvent(this.movieId);

  @override
  List<Object> get props => [movieId];
}

