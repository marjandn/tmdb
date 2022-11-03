part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchTopTabbarItemSelectedEvent extends SearchEvent {
  final SearchTypes searchTypes;
  const SearchTopTabbarItemSelectedEvent({required this.searchTypes});

  @override
  List<Object> get props => [searchTypes];
}

class MovieSeachRequestedEvent extends SearchEvent {
  final String query;
  const MovieSeachRequestedEvent({required this.query});

  @override
  List<Object> get props => [query];
}

class TvShowSeachRequestedEvent extends SearchEvent {
  final String query;
  const TvShowSeachRequestedEvent({required this.query});

  @override
  List<Object> get props => [query];
}

class PeopleSeachRequestedEvent extends SearchEvent {
  final String query;
  const PeopleSeachRequestedEvent({required this.query});

  @override
  List<Object> get props => [query];
}
