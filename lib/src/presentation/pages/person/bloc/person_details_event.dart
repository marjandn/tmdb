part of 'person_details_bloc.dart';

abstract class PersonDetailsEvent extends Equatable {
  const PersonDetailsEvent();

  @override
  List<Object> get props => [];
}

class PersonPrimaryDetailsRequestEvent extends PersonDetailsEvent {
  final int personId;
  const PersonPrimaryDetailsRequestEvent(this.personId);

  @override
  List<Object> get props => [personId];
}

class PersonPicturesRequestEvent extends PersonDetailsEvent {
  final int personId;
  const PersonPicturesRequestEvent(this.personId);

  @override
  List<Object> get props => [personId];
}
