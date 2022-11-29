part of 'person_details_bloc.dart';

abstract class PersonDetailsState extends Equatable {
  const PersonDetailsState();

  @override
  List<Object> get props => [];
}

class PersonDetailsInitial extends PersonDetailsState {}

class PersonPrimaryDetailsFailedState extends PersonDetailsState {
  const PersonPrimaryDetailsFailedState();
}

class PersonPrimaryDetailsLoadingState extends PersonDetailsState {
  const PersonPrimaryDetailsLoadingState();
}

class PersonPrimaryDetailsSuccessState extends PersonDetailsState {
  final People personDetails;
  const PersonPrimaryDetailsSuccessState({required this.personDetails});

  @override
  List<Object> get props => [personDetails];
}

class PersonPicturesFailedState extends PersonDetailsState {
  const PersonPicturesFailedState();
}

class PersonPicturesLoadingState extends PersonDetailsState {
  const PersonPicturesLoadingState();
}

class PersonPicturesSuccessState extends PersonDetailsState {
  final List<String> pictures;
  const PersonPicturesSuccessState({required this.pictures});

  @override
  List<Object> get props => [pictures];
}
