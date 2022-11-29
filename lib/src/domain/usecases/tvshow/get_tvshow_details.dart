import 'package:either_dart/either.dart';
import 'package:tmdb_prj/src/app/bases/usecase.dart';
import 'package:tmdb_prj/src/data/providers/remote/params/details_param.dart';
import 'package:tmdb_prj/src/domain/entities/tvshow_details.dart';

import '../../../app/errors/failure.dart';
import '../../repositories/tvshow_repository.dart';

class GetTvshowDetails extends UseCase<TvshowDetails, TvshowDetailsParam> {
  final TvShowRepository tvShowRepository;

  GetTvshowDetails({required this.tvShowRepository});

  @override
  Future<Either<Failur, TvshowDetails>> call(TvshowDetailsParam params) async =>
      await tvShowRepository.getTvshowPrimaryDetails(detailsParam: params);
}
