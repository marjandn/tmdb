part of 'people_list_bloc.dart';

abstract class PeopleListState extends Equatable {
  const PeopleListState();

  @override
  List<Object> get props => [];
}

class PeopleListInitial extends PeopleListState {}

class PeopleFetchRequestFailedState extends PeopleListState {
  const PeopleFetchRequestFailedState();
}

class PeopleFetchRequestSuccessState extends PeopleListState {
  final List<People> people;
  final bool showLazyLoading;
  const PeopleFetchRequestSuccessState({required this.people, required this.showLazyLoading});

  @override
  List<Object> get props => [people, showLazyLoading];
}
