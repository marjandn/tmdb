import 'package:either_dart/either.dart';
import 'package:tmdb_prj/src/app/errors/exceptions.dart';
import 'package:tmdb_prj/src/data/models/credits_response.dart';
import 'package:tmdb_prj/src/data/models/pictures_response.dart';
import 'package:tmdb_prj/src/data/models/tvshow_details_response.dart';
import 'package:tmdb_prj/src/data/models/tvshow_response.dart';
import 'package:tmdb_prj/src/data/providers/remote/params/details_param.dart';
import 'package:tmdb_prj/src/data/providers/remote/service/tvshow_remote_datasource.dart';
import 'package:tmdb_prj/src/domain/entities/credits.dart';
import 'package:tmdb_prj/src/domain/entities/tvshow.dart';
import 'package:tmdb_prj/src/app/errors/failure.dart';
import 'package:tmdb_prj/src/domain/entities/tvshow_details.dart';
import 'package:tmdb_prj/src/domain/repositories/tvshow_repository.dart';
import 'package:tmdb_prj/src/domain/usecases/movie/get_popular_movies.dart';
import 'package:tmdb_prj/src/domain/usecases/movie/search_movie.dart';

class TvShowRepositoryImpl extends TvShowRepository {
  TvShowRemoteDataSource tvShowRemoteDataSource;

  TvShowRepositoryImpl({required this.tvShowRemoteDataSource});

  @override
  Future<Either<Failur, List<TvShow>>> getFeaturedTvShows(
      {required PagingParam pagingParam}) async {
    try {
      TvShowResponse tvShowResponse =
          await tvShowRemoteDataSource.getFeaturedTvShows(pagingParam: pagingParam);

      return Right(tvShowResponse.toEntity());
    } on ServerException catch (error) {
      return Left(ServerFailuer(error.errorMessage));
    }
  }

  @override
  Future<Either<Failur, List<TvShow>>> getLatestTvShows({required PagingParam pagingParam}) async {
    try {
      TvShowResponse tvShowResponse =
          await tvShowRemoteDataSource.getLatestTvShows(pagingParam: pagingParam);

      return Right(tvShowResponse.toEntity());
    } on ServerException catch (error) {
      return Left(ServerFailuer(error.errorMessage));
    }
  }

  @override
  Future<Either<Failur, List<TvShow>>> getPopularTvShows({required PagingParam pagingParam}) async {
    try {
      TvShowResponse tvShowResponse =
          await tvShowRemoteDataSource.getPopularTvShows(pagingParam: pagingParam);

      return Right(tvShowResponse.toEntity());
    } on ServerException catch (error) {
      return Left(ServerFailuer(error.errorMessage));
    }
  }

  @override
  Future<Either<Failur, List<TvShow>>> searchTvshow({required SearchParams searchParams}) async {
    try {
      final TvShowResponse tvShowResponse =
          await tvShowRemoteDataSource.searchTvshow(searchParams: searchParams);

      return Right(tvShowResponse.toEntity());
    } on ServerException catch (error) {
      return Left(ServerFailuer(error.errorMessage));
    }
  }

  @override
  Future<Either<Failur, List<Credits>>> getTvshowCredits(
      {required TvshowDetailsParam detailsParam}) async {
    try {
      final CreditsResponse tvShowResponse =
          await tvShowRemoteDataSource.getTvShowCredits(detailsParam: detailsParam);

      return Right(tvShowResponse.toEntity());
    } on ServerException catch (error) {
      return Left(ServerFailuer(error.errorMessage));
    }
  }

  @override
  Future<Either<Failur, List<String>>> getTvshowPictures(
      {required TvshowDetailsParam detailsParam}) async {
    try {
      final PicturesResponse tvShowResponse =
          await tvShowRemoteDataSource.getTvShowPictures(detailsParam: detailsParam);

      return Right(tvShowResponse.toEnity());
    } on ServerException catch (error) {
      return Left(ServerFailuer(error.errorMessage));
    }
  }

  @override
  Future<Either<Failur, TvshowDetails>> getTvshowPrimaryDetails(
      {required TvshowDetailsParam detailsParam}) async {
    try {
      final TvshowDetailsResponse tvShowResponse =
          await tvShowRemoteDataSource.getTvshowDetails(detailsParam: detailsParam);

      return Right(tvShowResponse.toEntity());
    } on ServerException catch (error) {
      return Left(ServerFailuer(error.errorMessage));
    }
  }
}
