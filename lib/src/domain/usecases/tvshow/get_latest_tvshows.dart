import 'package:either_dart/src/either.dart';
import 'package:tmdb_prj/src/app/bases/usecase.dart';
import 'package:tmdb_prj/src/app/errors/failure.dart';
import 'package:tmdb_prj/src/domain/repositories/tvshow_repository.dart';

import '../../entities/tvshow.dart';
import '../movie/get_popular_movies.dart';

class GetLatestTvShows extends UseCase<List<TvShow>, PagingParam> {
  final TvShowRepository tvShowRepository;

  GetLatestTvShows({required this.tvShowRepository});

  @override
  Future<Either<Failur, List<TvShow>>> call(PagingParam params) async =>
      await tvShowRepository.getLatestTvShows(pagingParam: params);
}
