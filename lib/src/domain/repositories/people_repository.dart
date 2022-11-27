import 'package:either_dart/either.dart';
import 'package:tmdb_prj/src/app/errors/failure.dart';
import 'package:tmdb_prj/src/data/providers/remote/params/details_param.dart';
import 'package:tmdb_prj/src/domain/entities/people.dart';
import 'package:tmdb_prj/src/domain/usecases/movie/get_popular_movies.dart';
import 'package:tmdb_prj/src/domain/usecases/movie/search_movie.dart';

abstract class PeopleRepository {
  Future<Either<Failur, List<People>>> getPopularPeople({required PagingParam pagingParam});

  Future<Either<Failur, List<People>>> searchPeople({required SearchParams searchParams});

  Future<Either<Failur, People>> getPersonDetails({required PersonDetailsParam param});
  Future<Either<Failur, List<String>>> getPersonPictures({required PersonDetailsParam param});
}
