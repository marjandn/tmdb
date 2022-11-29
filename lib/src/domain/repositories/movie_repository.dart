import 'package:either_dart/either.dart';
import 'package:tmdb_prj/src/app/errors/failure.dart';
import 'package:tmdb_prj/src/data/providers/remote/params/details_param.dart';
import 'package:tmdb_prj/src/domain/entities/movie.dart';
import 'package:tmdb_prj/src/domain/entities/credits.dart';
import 'package:tmdb_prj/src/domain/entities/movie_details.dart';
import 'package:tmdb_prj/src/domain/usecases/movie/get_popular_movies.dart';
import 'package:tmdb_prj/src/domain/usecases/movie/search_movie.dart';

abstract class MovieRepository {
  Future<Either<Failur, List<Movie>>> getPopularMovies({required PagingParam pagingParam});
  Future<Either<Failur, List<Movie>>> getUpComingMovies({required PagingParam pagingParam});
  Future<Either<Failur, List<Movie>>> getFeaturedMovies({required PagingParam pagingParam});
  Future<Either<Failur, List<Movie>>> getLatestMovies({required PagingParam pagingParam});

  Future<Either<Failur, List<Movie>>> searchMovies({required SearchParams searchParams});

  Future<Either<Failur, MovieDetails>> getMovieDetails({required MovieDetailsParam param});
  Future<Either<Failur, List<String>>> getMoviePictures({required MovieDetailsParam param});
  Future<Either<Failur, List<Credits>>> getMovieCredits({required MovieDetailsParam param});
}
