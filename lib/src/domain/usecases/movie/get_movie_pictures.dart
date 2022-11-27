import 'package:either_dart/either.dart';
import 'package:tmdb_prj/src/data/providers/remote/params/details_param.dart';

import '../../../app/bases/usecase.dart';
import '../../../app/errors/failure.dart';
import '../../repositories/movie_repository.dart';

class GetMoviePictures extends UseCase<List<String>, MovieDetailsParam> {
  final MovieRepository movieRepository;

  GetMoviePictures({required this.movieRepository});

  @override
  Future<Either<Failur, List<String>>> call(MovieDetailsParam params) async =>
      await movieRepository.getMoviePictures(param: params);
}
