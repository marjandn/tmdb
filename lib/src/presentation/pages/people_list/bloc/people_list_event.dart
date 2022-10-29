part of 'people_list_bloc.dart';

abstract class PeopleListEvent extends Equatable {
  const PeopleListEvent();

  @override
  List<Object> get props => [];
}

class PopularPeopleListRequestedEvent extends PeopleListEvent {
  final int page;
  const PopularPeopleListRequestedEvent({required this.page});

  @override
  List<Object> get props => [page];
}
