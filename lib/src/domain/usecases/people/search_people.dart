import 'package:either_dart/src/either.dart';
import 'package:tmdb_prj/src/app/bases/usecase.dart';
import 'package:tmdb_prj/src/app/errors/failure.dart';
import 'package:tmdb_prj/src/domain/entities/people.dart';
import 'package:tmdb_prj/src/domain/repositories/people_repository.dart';
import 'package:tmdb_prj/src/domain/usecases/movie/search_movie.dart';

class SearchPeople extends UseCase<List<People>, SearchParams> {
  final PeopleRepository peopleRepository;

  SearchPeople({required this.peopleRepository});

  @override
  Future<Either<Failur, List<People>>> call(SearchParams params) async =>
      await peopleRepository.searchPeople(searchParams: params);
}
