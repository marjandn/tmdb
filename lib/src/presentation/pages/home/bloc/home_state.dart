part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

// * Popular Movies
class PopularMoviesFetchLoadingState extends HomeState {
  const PopularMoviesFetchLoadingState();
}

class PopularMoviesFetchSuccessState extends HomeState {
  final List<Movie> movies;
  const PopularMoviesFetchSuccessState({required this.movies});

  @override
  List<Object> get props => [movies];
}

class PopularMoviesFetchFailedState extends HomeState {
  const PopularMoviesFetchFailedState();
}

// * Featured Movies
class FeaturedMoviesFetchLoadingState extends HomeState {
  const FeaturedMoviesFetchLoadingState();
}

class FeaturedMoviesFetchSuccessState extends HomeState {
  final List<Movie> movies;
  const FeaturedMoviesFetchSuccessState({required this.movies});

  @override
  List<Object> get props => [movies];
}

class FeaturedMoviesFetchFailedState extends HomeState {
  const FeaturedMoviesFetchFailedState();
}

// * Upcoming movies
class UpcomingMoviesFetchLoadingState extends HomeState {
  const UpcomingMoviesFetchLoadingState();
}

class UpcomingMoviesFetchFailedState extends HomeState {
  const UpcomingMoviesFetchFailedState();
}

class UpcomingMoviesFetchSuccessState extends HomeState {
  final List<Movie> movies;

  const UpcomingMoviesFetchSuccessState({required this.movies});
  @override
  List<Object> get props => [movies];
}

// * Popular TvShows
class PopularTvShowsFetchLoadingState extends HomeState {
  const PopularTvShowsFetchLoadingState();
}

class PopularTvShowsFetchFailedState extends HomeState {
  const PopularTvShowsFetchFailedState();
}

class PopularTvShowsFetchSuccessState extends HomeState {
  final List<TvShow> tvShows;

  const PopularTvShowsFetchSuccessState({required this.tvShows});

  @override
  List<Object> get props => [tvShows];
}

// * Featured TvShows
class FeaturedTvShowsFetchLoadingState extends HomeState {
  const FeaturedTvShowsFetchLoadingState();
}

class FeaturedTvShowsFetchFailedState extends HomeState {
  const FeaturedTvShowsFetchFailedState();
}

class FeaturedTvShowsFetchSuccessState extends HomeState {
  final List<TvShow> tvShows;

  const FeaturedTvShowsFetchSuccessState({required this.tvShows});

  @override
  List<Object> get props => [tvShows];
}

// * Popular People
class PopularPeopleFetchLoadingState extends HomeState {
  const PopularPeopleFetchLoadingState();
}

class PopularPeopleFetchFailedState extends HomeState {
  const PopularPeopleFetchFailedState();
}

class PopularPeopleFetchSuccessState extends HomeState {
  final List<People> people;
  const PopularPeopleFetchSuccessState({required this.people});

  @override
  List<Object> get props => [people];
}
