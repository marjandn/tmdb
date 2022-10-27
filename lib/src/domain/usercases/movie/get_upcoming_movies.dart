import 'package:either_dart/src/either.dart';
import 'package:tmdb_prj/src/app/bases/usecase.dart';
import 'package:tmdb_prj/src/app/errors/failure.dart';
import 'package:tmdb_prj/src/domain/entities/movie.dart';
import 'package:tmdb_prj/src/domain/repositories/movie_repository.dart';

class GetUpcomingMovies extends UseCase<List<Movie>, NoParam> {
  final MovieRepository movieRepository;

  GetUpcomingMovies({required this.movieRepository});

  @override
  Future<Either<Failur, List<Movie>>> call(NoParam params) async =>
      await movieRepository.getUpComingMovies();
}
