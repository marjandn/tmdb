import 'package:either_dart/either.dart';
import 'package:tmdb_prj/src/app/errors/failure.dart';
import 'package:tmdb_prj/src/domain/entities/people.dart';
import 'package:tmdb_prj/src/domain/usercases/movie/get_popular_movies.dart';

abstract class PeopleRepository {
  Future<Either<Failur, List<People>>> getPopularPeople({required PagingParam pagingParam});
}
