import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tmdb_prj/src/app/errors/exceptions.dart';
import 'package:tmdb_prj/src/app/errors/failure.dart';
import 'package:tmdb_prj/src/data/models/people_response.dart';
import 'package:tmdb_prj/src/data/providers/remote/service/people_remote_datasource.dart';
import 'package:tmdb_prj/src/data/repositories/people_repository_impl.dart';
import 'package:tmdb_prj/src/domain/entities/people.dart';
import 'package:tmdb_prj/src/domain/usecases/movie/search_movie.dart';

import 'people_repository_impl_test.mocks.dart';

// class MockPeopleRemoteDataSource extends Mock implements PeopleRemoteDataSource {}

@GenerateMocks([PeopleRemoteDataSource])
void main() {
  late PeopleRepositoryImpl peopleRepositoryImpl;
  late PeopleRemoteDataSource peopleRemoteDataSource;
  late SearchParams searchParams;

  setUpAll(
    () {
      peopleRemoteDataSource = MockPeopleRemoteDataSource();
      peopleRepositoryImpl = PeopleRepositoryImpl(peopleRemoteDataSource: peopleRemoteDataSource);
      searchParams = SearchParams(query: "brad", page: 1);
    },
  );

  group(
    "Search People Request tests",
    () {
      test("Search People, Return success response", () async {
        // Arrange
        PeopleResponse peopleResponse = const PeopleResponse();
        when(peopleRemoteDataSource.searchPeople(params: searchParams))
            .thenAnswer((realInvocation) async => peopleResponse);

        // Act
        Either<Failur, List<People>> response =
            await peopleRepositoryImpl.searchPeople(searchParams: searchParams);

        // Assert
        expect(response.isRight, true);
        expect(response.right, peopleResponse.toEntity());
      });

      test("Search People, Throw an exception", () async {
        // Arrange
        String errorMessage = "Connection timeout";
        when(peopleRemoteDataSource.searchPeople(params: searchParams))
            .thenThrow(ServerException(errorMessage));

        // Act
        Either<Failur, List<People>> response =
            await peopleRepositoryImpl.searchPeople(searchParams: searchParams);

        // Assert
        expect(response.isLeft, true);
        expect(response.left, ServerFailuer(errorMessage));
      });
    },
  );
}
