import 'package:either_dart/either.dart';
import 'package:tmdb_prj/src/app/errors/failure.dart';
import 'package:tmdb_prj/src/domain/entities/movie.dart';
import 'package:tmdb_prj/src/domain/repositories/movie_repository.dart';

class GetPopularMovies {
  final MovieRepository movieRepository;

  GetPopularMovies({required this.movieRepository});

  Future<Either<Failur, List<Movie>>> call(int page) async =>
      await movieRepository.getPopularMovies(pagingParam: PagingParam(page: page));
}

class PagingParam {
  final int page;

  PagingParam({required this.page});

  Map<String, dynamic> toJson() => {'page': page};
}
