import 'package:either_dart/src/either.dart';
import 'package:tmdb_prj/src/app/bases/usecase.dart';
import 'package:tmdb_prj/src/app/errors/failure.dart';
import 'package:tmdb_prj/src/domain/repositories/tvshow_repository.dart';

import '../../entities/tvshow.dart';

class GetLatestTvShows extends UseCase<List<TvShow>, NoParam> {
  final TvShowRepository tvShowRepository;

  GetLatestTvShows({required this.tvShowRepository});

  @override
  Future<Either<Failur, List<TvShow>>> call(NoParam params) async =>
      await tvShowRepository.getLatestTvShows();
}
