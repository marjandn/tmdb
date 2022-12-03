import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:tmdb_prj/src/app/errors/failure.dart';
import 'package:tmdb_prj/src/data/providers/remote/params/details_param.dart';
import 'package:tmdb_prj/src/domain/entities/people.dart';
import 'package:tmdb_prj/src/domain/usecases/people/get_person_details.dart';
import 'package:tmdb_prj/src/domain/usecases/people/get_person_pictures.dart';

part 'person_details_event.dart';
part 'person_details_state.dart';

class PersonDetailsBloc extends Bloc<PersonDetailsEvent, PersonDetailsState> {
  final GetPersonDetails getPersonDetails;
  final GetPersonPictures getPersonPictures;

  PersonDetailsBloc({required this.getPersonDetails, required this.getPersonPictures})
      : super(PersonDetailsInitial()) {
    on<PersonPrimaryDetailsRequestEvent>((event, emit) async {
      emit(const PersonPrimaryDetailsLoadingState());

      Either<Failur, People> response = await getPersonDetails.call(event.personId);

      response.fold((left) => emit(const PersonPrimaryDetailsFailedState()),
          (right) => emit(PersonPrimaryDetailsSuccessState(personDetails: right)));
    });

    on<PersonPicturesRequestEvent>((event, emit) async {
      emit(const PersonPicturesLoadingState());

      Either<Failur, List<String>> response =
          await getPersonPictures.call(PersonDetailsParam(personId: event.personId));

      response.fold((left) => emit(const PersonPicturesFailedState()),
          (right) => emit(PersonPicturesSuccessState(pictures: right)));
    });
  }
}
