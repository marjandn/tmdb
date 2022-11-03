import 'package:either_dart/src/either.dart';
import 'package:tmdb_prj/src/app/bases/usecase.dart';
import 'package:tmdb_prj/src/app/errors/failure.dart';
import 'package:tmdb_prj/src/domain/repositories/tvshow_repository.dart';
import 'package:tmdb_prj/src/domain/usecases/movie/get_popular_movies.dart';

import '../../entities/tvshow.dart';

class GetPopularTvShows extends UseCase<List<TvShow>, PagingParam> {
  final TvShowRepository tvShowRepository;

  GetPopularTvShows({required this.tvShowRepository});

  @override
  Future<Either<Failur, List<TvShow>>> call(PagingParam params) async =>
      await tvShowRepository.getPopularTvShows(pagingParam: params);
}
