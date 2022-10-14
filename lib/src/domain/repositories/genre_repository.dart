import 'package:either_dart/either.dart';
import 'package:tmdb_prj/src/app/bases/usecase.dart';

import '../../app/errors/failure.dart';
import '../entities/genre.dart';

abstract class GenreRepository {
  Future<Either<Failur, Genre>> getMovieGenres();

  Future<Either<Failur, Genre>> getTvShowGenres();
}
