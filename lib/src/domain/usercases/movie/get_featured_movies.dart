import 'package:either_dart/src/either.dart';
import 'package:tmdb_prj/src/app/bases/usecase.dart';
import 'package:tmdb_prj/src/app/errors/failure.dart';
import 'package:tmdb_prj/src/domain/entities/movie.dart';
import 'package:tmdb_prj/src/domain/repositories/movie_repository.dart';

import 'get_popular_movies.dart';

class GetFeaturedMovies extends UseCase<List<Movie>, PagingParam> {
  final MovieRepository movieRepository;

  GetFeaturedMovies({required this.movieRepository});

  @override
  Future<Either<Failur, List<Movie>>> call(PagingParam params) async =>
      await movieRepository.getFeaturedMovies(pagingParam: params);
}
