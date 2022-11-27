import 'package:either_dart/either.dart';
import 'package:tmdb_prj/src/app/errors/exceptions.dart';
import 'package:tmdb_prj/src/data/models/people_response.dart';
import 'package:tmdb_prj/src/data/models/person_pictures_response.dart';
import 'package:tmdb_prj/src/data/providers/remote/params/details_param.dart';
import 'package:tmdb_prj/src/data/providers/remote/service/people_remote_datasource.dart';
import 'package:tmdb_prj/src/domain/entities/people.dart';
import 'package:tmdb_prj/src/app/errors/failure.dart';
import 'package:tmdb_prj/src/domain/repositories/people_repository.dart';
import 'package:tmdb_prj/src/domain/usecases/movie/get_popular_movies.dart';
import 'package:tmdb_prj/src/domain/usecases/movie/search_movie.dart';

class PeopleRepositoryImpl extends PeopleRepository {
  final PeopleRemoteDataSource peopleRemoteDataSource;

  PeopleRepositoryImpl({required this.peopleRemoteDataSource});
  @override
  Future<Either<Failur, List<People>>> getPopularPeople({required PagingParam pagingParam}) async {
    try {
      final PeopleResponse peopleResponse =
          await peopleRemoteDataSource.getPopularPeople(pagingParam: pagingParam);

      return Right(peopleResponse.toEntity());
    } on ServerException catch (error) {
      return Left(ServerFailuer(error.errorMessage));
    }
  }

  @override
  Future<Either<Failur, List<People>>> searchPeople({required SearchParams searchParams}) async {
    try {
      final PeopleResponse peopleResponse =
          await peopleRemoteDataSource.searchPeople(params: searchParams);

      return Right(peopleResponse.toEntity());
    } on ServerException catch (error) {
      return Left(ServerFailuer(error.errorMessage));
    }
  }

  @override
  Future<Either<Failur, People>> getPersonDetails({required PersonDetailsParam param}) async {
    try {
      final PersonRespone peopleResponse =
          await peopleRemoteDataSource.getPersonDetails(param: param);

      return Right(peopleResponse.toEntity());
    } on ServerException catch (error) {
      return Left(ServerFailuer(error.errorMessage));
    }
  }

  @override
  Future<Either<Failur, List<String>>> getPersonPictures(
      {required PersonDetailsParam param}) async {
    try {
      final PersonPicturesResponnse peopleResponse =
          await peopleRemoteDataSource.getPersonPictures(param: param);

      return Right(peopleResponse.toEntity());
    } on ServerException catch (error) {
      return Left(ServerFailuer(error.errorMessage));
    }
  }
}
