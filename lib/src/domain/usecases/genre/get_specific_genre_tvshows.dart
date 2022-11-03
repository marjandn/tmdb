import 'package:either_dart/either.dart';
import 'package:tmdb_prj/src/app/bases/usecase.dart';
import 'package:tmdb_prj/src/app/errors/failure.dart';
import 'package:tmdb_prj/src/domain/entities/tvshow.dart';
import 'package:tmdb_prj/src/domain/repositories/tvshow_repository.dart';

class GetSpecificGenreTvShows extends UseCase<TvShow, GenreParams> {
  TvShowRepository tvShowRepository;

  GetSpecificGenreTvShows({required this.tvShowRepository});

  @override
  Future<Either<Failur, TvShow>> call(GenreParams params) =>
      tvShowRepository.getSpecificGenreTvShows(genreParams: params);
}

class GenreParams {
  int id;

  GenreParams({required this.id});

  Map<String, dynamic> toJson() => {"id": id};
}
