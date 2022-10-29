import 'package:either_dart/either.dart';
import 'package:tmdb_prj/src/app/errors/failure.dart';
import 'package:tmdb_prj/src/domain/entities/tvshow.dart';
import 'package:tmdb_prj/src/domain/usercases/genre/get_specific_genre_tvshows.dart';
import 'package:tmdb_prj/src/domain/usercases/movie/get_popular_movies.dart';

abstract class TvShowRepository {
  Future<Either<Failur, TvShow>> getSpecificGenreTvShows({required GenreParams genreParams});

  Future<Either<Failur, List<TvShow>>> getPopularTvShows({required PagingParam pagingParam});
  Future<Either<Failur, List<TvShow>>> getFeaturedTvShows({required PagingParam pagingParam});
  Future<Either<Failur, List<TvShow>>> getLatestTvShows({required PagingParam pagingParam});
}
