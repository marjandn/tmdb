import 'package:either_dart/either.dart';
import 'package:tmdb_prj/src/app/errors/exceptions.dart';
import 'package:tmdb_prj/src/data/models/tvshow_response.dart';
import 'package:tmdb_prj/src/data/providers/remote/service/tvshow_remote_datasource.dart';
import 'package:tmdb_prj/src/domain/entities/tvshow.dart';
import 'package:tmdb_prj/src/app/errors/failure.dart';
import 'package:tmdb_prj/src/domain/repositories/tvshow_repository.dart';
import 'package:tmdb_prj/src/domain/usercases/genre/get_specific_genre_tvshows.dart';
import 'package:tmdb_prj/src/domain/usercases/movie/get_popular_movies.dart';

class TvShowRepositoryImpl extends TvShowRepository {
  TvShowRemoteDataSource tvShowRemoteDataSource;

  TvShowRepositoryImpl({required this.tvShowRemoteDataSource});

  @override
  Future<Either<Failur, TvShow>> getSpecificGenreTvShows({required GenreParams genreParams}) {
    // TODO: implement getSpecificGenreTvShows
    throw UnimplementedError();
  }

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
}
