import 'package:either_dart/either.dart';
import 'package:tmdb_prj/src/data/providers/remote/params/details_param.dart';
import 'package:tmdb_prj/src/domain/entities/movie_details.dart';

import '../../../app/bases/usecase.dart';
import '../../../app/errors/failure.dart';
import '../../repositories/movie_repository.dart';

class GetMovieDetails extends UseCase<MovieDetails, MovieDetailsParam> {
  final MovieRepository movieRepository;

  GetMovieDetails({required this.movieRepository});

  @override
  Future<Either<Failur, MovieDetails>> call(MovieDetailsParam params) async =>
      await movieRepository.getMovieDetails(param: params);
}
