import 'package:either_dart/src/either.dart';
import 'package:tmdb_prj/src/app/bases/usecase.dart';
import 'package:tmdb_prj/src/app/errors/failure.dart';
import 'package:tmdb_prj/src/domain/entities/tvshow.dart';
import 'package:tmdb_prj/src/domain/repositories/tvshow_repository.dart';
import 'package:tmdb_prj/src/domain/usecases/movie/search_movie.dart';

class SearchTvshow extends UseCase<List<TvShow>, SearchParams> {
  final TvShowRepository tvShowRepository;

  SearchTvshow({required this.tvShowRepository});

  @override
  Future<Either<Failur, List<TvShow>>> call(SearchParams params) async =>
      await tvShowRepository.searchTvshow(searchParams: params);
}
