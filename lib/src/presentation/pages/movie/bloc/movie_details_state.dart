part of 'movie_details_bloc.dart';

abstract class MovieDetailsState extends Equatable {
  const MovieDetailsState();

  @override
  List<Object?> get props => [];
}

class MovieDetailsInitial extends MovieDetailsState {}

// * MoviePrimaryDetails
class MoviePrimaryDetailsLoadingState extends MovieDetailsState {
  const MoviePrimaryDetailsLoadingState();
}

class MoviePrimaryDetailsFailedState extends MovieDetailsState {
  const MoviePrimaryDetailsFailedState();
}

class MoviePrimaryDetailsSuccessState extends MovieDetailsState {
  final MovieDetails movieDetails;

  const MoviePrimaryDetailsSuccessState({required this.movieDetails});

  @override
  List<Object?> get props => [movieDetails];
}

// * MoviePictures
class MoviePicturesLoadingState extends MovieDetailsState {
  const MoviePicturesLoadingState();
}

class MoviePicturesFailedState extends MovieDetailsState {
  const MoviePicturesFailedState();
}

class MoviePicturesSuccessState extends MovieDetailsState {
  final List<String> pictures;
  const MoviePicturesSuccessState(this.pictures);

  @override
  List<Object> get props => [pictures];
}

// * MovieCredits
class MovieCreditsLoadingState extends MovieDetailsState {
  const MovieCreditsLoadingState();
}

class MovieCreditsFailedState extends MovieDetailsState {
  const MovieCreditsFailedState();
}

class MovieCreditsSuccessState extends MovieDetailsState {
  final List<MovieCredits> credits;
  const MovieCreditsSuccessState(this.credits);

  @override
  List<Object> get props => [credits];
}
