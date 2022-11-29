part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

// * Movies
class PopularMoviesFetchRequestedEvent extends HomeEvent {
  const PopularMoviesFetchRequestedEvent();
}

class FeaturedMoviesFetchRequestedEvent extends HomeEvent {
  const FeaturedMoviesFetchRequestedEvent();
}

class UpcomingMoviesFetchRequestedEvent extends HomeEvent {
  const UpcomingMoviesFetchRequestedEvent();
}

// * TvShows
class PopularTvShowsFetchRequestedEvent extends HomeEvent {
  const PopularTvShowsFetchRequestedEvent();
}

class FeaturedTvShowsFetchRequestedEvent extends HomeEvent {
  const FeaturedTvShowsFetchRequestedEvent();
}

// * People
class PopularPeopleFetchRequestEvent extends HomeEvent {
  const PopularPeopleFetchRequestEvent();
}

class PeopleItemTappedEvent extends HomeEvent {
  final People people;
  const PeopleItemTappedEvent({required this.people});

  @override
  List<Object> get props => [people];
}
