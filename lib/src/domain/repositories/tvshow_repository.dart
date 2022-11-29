import 'package:either_dart/either.dart';
import 'package:tmdb_prj/src/app/errors/failure.dart';
import 'package:tmdb_prj/src/data/providers/remote/params/details_param.dart';
import 'package:tmdb_prj/src/domain/entities/credits.dart';
import 'package:tmdb_prj/src/domain/entities/tvshow.dart';
import 'package:tmdb_prj/src/domain/entities/tvshow_details.dart';
import 'package:tmdb_prj/src/domain/usecases/movie/get_popular_movies.dart';

import '../usecases/movie/search_movie.dart';

abstract class TvShowRepository {
  Future<Either<Failur, List<TvShow>>> getPopularTvShows({required PagingParam pagingParam});
  Future<Either<Failur, List<TvShow>>> getFeaturedTvShows({required PagingParam pagingParam});
  Future<Either<Failur, List<TvShow>>> getLatestTvShows({required PagingParam pagingParam});

  Future<Either<Failur, List<TvShow>>> searchTvshow({required SearchParams searchParams});

  Future<Either<Failur, List<String>>> getTvshowPictures(
      {required TvshowDetailsParam detailsParam});
  Future<Either<Failur, List<Credits>>> getTvshowCredits(
      {required TvshowDetailsParam detailsParam});
  Future<Either<Failur, TvshowDetails>> getTvshowPrimaryDetails(
      {required TvshowDetailsParam detailsParam});
}
