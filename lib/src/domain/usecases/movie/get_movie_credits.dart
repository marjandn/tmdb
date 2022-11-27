import 'package:either_dart/either.dart';
import 'package:tmdb_prj/src/domain/entities/movie_credits.dart';

import '../../../app/bases/usecase.dart';
import '../../../app/errors/failure.dart';
import '../../../data/providers/remote/params/details_param.dart';
import '../../repositories/movie_repository.dart';

class GetMovieCredits extends UseCase<List<MovieCredits>, MovieDetailsParam> {
  final MovieRepository movieRepository;

  GetMovieCredits({required this.movieRepository});

  @override
  Future<Either<Failur, List<MovieCredits>>> call(MovieDetailsParam params) async =>
      await movieRepository.getMovieCredits(param: params);
}
