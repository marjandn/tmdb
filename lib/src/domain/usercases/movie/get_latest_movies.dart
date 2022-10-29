import 'package:either_dart/either.dart';
import 'package:tmdb_prj/src/app/bases/usecase.dart';
import 'package:tmdb_prj/src/app/errors/failure.dart';
import 'package:tmdb_prj/src/domain/entities/movie.dart';
import 'package:tmdb_prj/src/domain/repositories/movie_repository.dart';
import 'package:tmdb_prj/src/domain/usercases/movie/get_popular_movies.dart';

class GetLatestMovies extends UseCase<List<Movie>, PagingParam> {
  final MovieRepository movieRepository;

  GetLatestMovies({required this.movieRepository});

  @override
  Future<Either<Failur, List<Movie>>> call(PagingParam params) async =>
      await movieRepository.getLatestMovies(pagingParam: params);
}
