import 'package:either_dart/either.dart';
import 'package:tmdb_prj/src/app/errors/exceptions.dart';
import 'package:tmdb_prj/src/data/models/people_response.dart';
import 'package:tmdb_prj/src/data/providers/remote/service/people_remote_datasource.dart';
import 'package:tmdb_prj/src/domain/entities/people.dart';
import 'package:tmdb_prj/src/app/errors/failure.dart';
import 'package:tmdb_prj/src/domain/repositories/people_repository.dart';
import 'package:tmdb_prj/src/domain/usercases/movie/get_popular_movies.dart';

class PeopleRepositoryImpl extends PeopleRepository {
  final PeopleRemoteDataSource peopleRemoteDataSource;

  PeopleRepositoryImpl({required this.peopleRemoteDataSource});
  @override
  Future<Either<Failur, List<People>>> getPopularPeople({required PagingParam pagingParam}) async {
    try {
      PeopleResponse peopleResponse =
          await peopleRemoteDataSource.getPopularPeople(pagingParam: pagingParam);

      return Right(peopleResponse.toEntity());
    } on ServerException catch (error) {
      return Left(ServerFailuer(error.errorMessage));
    }
  }
}
