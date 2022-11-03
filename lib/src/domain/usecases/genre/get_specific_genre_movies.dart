import 'package:either_dart/src/either.dart';
import 'package:tmdb_prj/src/app/bases/usecase.dart';
import 'package:tmdb_prj/src/app/errors/failure.dart';
import 'package:tmdb_prj/src/domain/entities/movie.dart';
import 'package:tmdb_prj/src/domain/repositories/movie_repository.dart';
import 'package:tmdb_prj/src/domain/usecases/genre/get_specific_genre_tvshows.dart';
import 'package:tmdb_prj/src/presentation/pages/genre/genre_page.dart';

class GetSpecificGenreMovies extends UseCase<Movie, GenreParams> {
  MovieRepository movieRepository;

  GetSpecificGenreMovies({required this.movieRepository});

  @override
  Future<Either<Failur, Movie>> call(GenreParams params) =>
      movieRepository.getSpecificGenreMovies(genreParams: params);
}
