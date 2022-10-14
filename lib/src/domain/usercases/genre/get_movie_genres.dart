import 'package:either_dart/src/either.dart';
import 'package:tmdb_prj/src/app/bases/usecase.dart';
import 'package:tmdb_prj/src/app/errors/failure.dart';
import 'package:tmdb_prj/src/domain/entities/genre.dart';
import 'package:tmdb_prj/src/domain/repositories/genre_repository.dart';

class GetMovieGenres extends UseCase<Genre, NoParam> {
  GenreRepository genreRepository;

  GetMovieGenres({required this.genreRepository});

  @override
  Future<Either<Failur, Genre>> call([NoParam params = const NoParam()]) =>
      genreRepository.getMovieGenres();
}
