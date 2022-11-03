import 'package:either_dart/src/either.dart';
import 'package:tmdb_prj/src/app/bases/usecase.dart';
import 'package:tmdb_prj/src/app/errors/failure.dart';
import 'package:tmdb_prj/src/domain/entities/movie.dart';
import 'package:tmdb_prj/src/domain/repositories/movie_repository.dart';

class SearchMovie extends UseCase<List<Movie>, SearchParams> {
  final MovieRepository movieRepository;

  SearchMovie({required this.movieRepository});

  @override
  Future<Either<Failur, List<Movie>>> call(SearchParams params) async =>
      movieRepository.searchMovies(searchParams: params);
}

class SearchParams {
  final String query;
  final int page;

  SearchParams({required this.query, required this.page});

  Map<String, dynamic> toJson() => {'query': query, 'page': page};
}
