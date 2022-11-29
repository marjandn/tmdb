import 'package:either_dart/either.dart';
import 'package:tmdb_prj/src/app/bases/usecase.dart';
import 'package:tmdb_prj/src/data/providers/remote/params/details_param.dart';

import '../../../app/errors/failure.dart';
import '../../repositories/tvshow_repository.dart';

class GetTvshowPictures extends UseCase<List<String>, TvshowDetailsParam> {
  final TvShowRepository tvShowRepository;

  GetTvshowPictures({required this.tvShowRepository});

  @override
  Future<Either<Failur, List<String>>> call(TvshowDetailsParam params) async =>
      await tvShowRepository.getTvshowPictures(detailsParam: params);
}
