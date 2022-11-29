import 'package:either_dart/either.dart';
import 'package:tmdb_prj/src/app/bases/usecase.dart';
import 'package:tmdb_prj/src/data/providers/remote/params/details_param.dart';
import 'package:tmdb_prj/src/domain/entities/credits.dart';

import '../../../app/errors/failure.dart';
import '../../repositories/tvshow_repository.dart';

class GetTvshowCredits extends UseCase<List<Credits>, TvshowDetailsParam> {
  final TvShowRepository tvShowRepository;

  GetTvshowCredits({required this.tvShowRepository});

  @override
  Future<Either<Failur, List<Credits>>> call(TvshowDetailsParam params) async =>
      await tvShowRepository.getTvshowCredits(detailsParam: params);
}
