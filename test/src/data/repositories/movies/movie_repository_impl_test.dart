import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tmdb_prj/src/app/errors/exceptions.dart';
import 'package:tmdb_prj/src/app/errors/failure.dart';
import 'package:tmdb_prj/src/data/models/movie_response.dart';
import 'package:tmdb_prj/src/data/providers/local/movie_local_datasource.dart';
import 'package:tmdb_prj/src/data/providers/remote/service/movie_remote_datasource.dart';
import 'package:tmdb_prj/src/data/repositories/movie_repository_impl.dart';
import 'package:tmdb_prj/src/domain/entities/movie.dart';
import 'package:tmdb_prj/src/domain/usecases/movie/get_popular_movies.dart';

import 'movie_repository_impl_test.mocks.dart';

@GenerateMocks([MovieRemoteDataSource, MovieLocalDataSource])
void main() {
  late MovieRepositoryImpl movieRepositoryImpl;
  late MovieRemoteDataSource movieRemoteDataSource;
  late MovieLocalDataSource movieLocalDataSource;
  setUpAll(
    () {
      movieRemoteDataSource = MockMovieRemoteDataSource();
      movieLocalDataSource = MockMovieLocalDataSource();
      movieRepositoryImpl = MovieRepositoryImpl(
          movieRemoteDataSource: movieRemoteDataSource, movieLocalDataSource: movieLocalDataSource);
    },
  );

  group(
    "Popular Movies Request tests",
    () {
      test(
        "Test getPopularMovies function, must return success",
        () async {
          // Arrange
          PagingParam paginParamFake = PagingParam(page: 1);
          MovieResponse movieResponse = const MovieResponse();
          when(movieRemoteDataSource.getPopularMovies(pagingParam: paginParamFake))
              .thenAnswer((_) async => movieResponse);
          when(movieLocalDataSource.getPopularMoviesFirstPage()).thenAnswer((_) => movieResponse);

          // Act
          Either<Failur, List<Movie>> response =
              await movieRepositoryImpl.getPopularMovies(pagingParam: paginParamFake);

          // Assert
          verify(movieLocalDataSource.savePopularMoviesFirstPage(movieResponse: movieResponse))
              .called(1);
          expect(response.isRight, true);
          expect(response.right, movieResponse.toEntity());
        },
      );

      test(
        "Test getPopularMovies function, must return failed",
        () async {
          // Arrange
          PagingParam paginParamFake = PagingParam(page: 1);
          MovieResponse movieResponse = const MovieResponse();
          when(movieRemoteDataSource.getPopularMovies(pagingParam: paginParamFake))
              .thenThrow(const ServerException("No internet connection"));

          // Act
          Either<Failur, List<Movie>> response =
              await movieRepositoryImpl.getPopularMovies(pagingParam: paginParamFake);

          // Assert
          verifyNever(
              movieLocalDataSource.savePopularMoviesFirstPage(movieResponse: movieResponse));
          expect(response.isRight, false);
          expect(response.left, const ServerFailuer("No internet connection"));
        },
      );
    },
  );
}
