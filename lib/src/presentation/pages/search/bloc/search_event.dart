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
