import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:tmdb_prj/src/domain/usercases/genre/get_movie_genres.dart';
import 'package:tmdb_prj/src/domain/usercases/genre/get_tvshow_genres.dart';

import '../../../../app/errors/failure.dart';
import '../../../../domain/entities/genre.dart';

part 'genre_event.dart';
part 'genre_state.dart';

abstract class GenreBloc extends Bloc<GenreEvent, GenreState> {
  final GetMovieGenres getMovieGenres;
  final GetTvShowGenres getTvShowGenres;

  GenreBloc({required this.getMovieGenres, required this.getTvShowGenres})
      : super(const GenreTabSelectionState(selectionTabIndex: 0)) {
    on<TabItemSelected>(
      (event, emit) async {
        emit(GenreTabSelectionState(selectionTabIndex: event.tabItemIndex));

        emit(const GenresDataLoading());

        if (event.tabItemIndex == 0) {
          Either<Failur, Genre> response = await getMovieGenres.call();

          response.fold((left) => emit(const GenresDataFaile()),
              (right) => emit(GenresDataSuccess(genres: response.right)));
        } else {
          Either<Failur, Genre> response = await getTvShowGenres.call();

          response.fold((left) => emit(const GenresDataFaile()),
              (right) => emit(GenresDataSuccess(genres: response.right)));
        }
      },
    );

    on<GenreItemSelected>(
      (event, emit) {},
    );
  }

  void dispose() {}
}
