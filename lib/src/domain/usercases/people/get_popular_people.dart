import 'package:either_dart/src/either.dart';
import 'package:tmdb_prj/src/app/bases/usecase.dart';
import 'package:tmdb_prj/src/app/errors/failure.dart';
import 'package:tmdb_prj/src/domain/entities/people.dart';
import 'package:tmdb_prj/src/domain/repositories/people_repository.dart';
import 'package:tmdb_prj/src/domain/usercases/movie/get_popular_movies.dart';

class GetPopularPeople extends UseCase<List<People>, PagingParam> {
  final PeopleRepository peopleRepository;

  GetPopularPeople({required this.peopleRepository});

  @override
  Future<Either<Failur, List<People>>> call(PagingParam params) async =>
      await peopleRepository.getPopularPeople(pagingParam: params);
}
