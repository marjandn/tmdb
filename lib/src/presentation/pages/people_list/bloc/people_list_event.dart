part of 'people_list_bloc.dart';

abstract class PeopleListEvent extends Equatable {
  const PeopleListEvent();

  @override
  List<Object> get props => [];
}

class PopularPeopleListRequestedEvent extends PeopleListEvent {
  const PopularPeopleListRequestedEvent();

  @override
  List<Object> get props => [];
}
