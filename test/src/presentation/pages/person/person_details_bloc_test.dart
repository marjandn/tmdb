import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tmdb_prj/src/app/errors/failure.dart';
import 'package:tmdb_prj/src/domain/entities/people.dart';
import 'package:tmdb_prj/src/domain/usecases/people/get_person_details.dart';
import 'package:tmdb_prj/src/domain/usecases/people/get_person_pictures.dart';
import 'package:tmdb_prj/src/presentation/pages/person/bloc/person_details_bloc.dart';
import 'package:bloc_test/bloc_test.dart';

import 'person_details_bloc_test.mocks.dart';

@GenerateMocks([GetPersonDetails, GetPersonPictures])
void main() {
  late PersonDetailsBloc personDetailsBloc;
  late GetPersonDetails mockGetPersonDetails;

  late Either<Failur, People> fakeSuccessAnswer;

  setUp(() {
    mockGetPersonDetails = MockGetPersonDetails();
    personDetailsBloc = PersonDetailsBloc(
        getPersonDetails: mockGetPersonDetails, getPersonPictures: MockGetPersonPictures());
  });

  blocTest<PersonDetailsBloc, PersonDetailsState>(
    'emits [People] when PersonPrimaryDetailsRequestEvent is added.',
    build: () => personDetailsBloc,
    setUp: () {
      fakeSuccessAnswer = const Right(People(id: 1));

      when(mockGetPersonDetails.call(1)).thenAnswer((_) async => fakeSuccessAnswer);
    },
    act: (PersonDetailsBloc bloc) => bloc.add(const PersonPrimaryDetailsRequestEvent(1)),
    expect: () => <PersonDetailsState>[
      const PersonPrimaryDetailsLoadingState(),
      PersonPrimaryDetailsSuccessState(personDetails: fakeSuccessAnswer.right)
    ],
  );

  blocTest<PersonDetailsBloc, PersonDetailsState>(
    'emits [PersonFailedState] when PersonPrimaryDetailsRequestEvent is added.',
    build: () => personDetailsBloc,
    setUp: () {
      when(mockGetPersonDetails.call(1))
          .thenAnswer((_) async => const Left(ServerFailuer("Bad Internet")));
    },
    act: (PersonDetailsBloc bloc) => bloc.add(const PersonPrimaryDetailsRequestEvent(1)),
    expect: () => const <PersonDetailsState>[
      PersonPrimaryDetailsLoadingState(),
      PersonPrimaryDetailsFailedState()
    ],
  );
}
