import 'package:either_dart/src/either.dart';
import 'package:tmdb_prj/src/app/bases/usecase.dart';
import 'package:tmdb_prj/src/app/errors/failure.dart';
import 'package:tmdb_prj/src/domain/entities/movie.dart';
import 'package:tmdb_prj/src/domain/repositories/movie_repository.dart';

class GetPopularMovies extends UseCase<List<Movie>, PagingParam> {
  final MovieRepository movieRepository;

  GetPopularMovies({required this.movieRepository});

  @override
  Future<Either<Failur, List<Movie>>> call(PagingParam params) async =>
      await movieRepository.getPopularMovies(pagingParam: params);
}

class PagingParam {
  final int page;

  PagingParam({required this.page});

  Map<String, dynamic> toJson() => {'page': page};
}
