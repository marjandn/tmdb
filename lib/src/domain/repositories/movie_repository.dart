import 'package:either_dart/either.dart';
import 'package:tmdb_prj/src/app/errors/failure.dart';
import 'package:tmdb_prj/src/domain/entities/movie.dart';
import 'package:tmdb_prj/src/domain/usercases/genre/get_specific_genre_tvshows.dart';
import 'package:tmdb_prj/src/domain/usercases/movie/get_popular_movies.dart';

abstract class MovieRepository {
  Future<Either<Failur, Movie>> getSpecificGenreMovies({required GenreParams genreParams});

  Future<Either<Failur, List<Movie>>> getPopularMovies({required PagingParam pagingParam});
  Future<Either<Failur, List<Movie>>> getUpComingMovies({required PagingParam pagingParam});
  Future<Either<Failur, List<Movie>>> getFeaturedMovies({required PagingParam pagingParam});
  Future<Either<Failur, List<Movie>>> getLatestMovies({required PagingParam pagingParam});
}
