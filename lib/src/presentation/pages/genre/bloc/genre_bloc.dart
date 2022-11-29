import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:tmdb_prj/src/app/errors/failure.dart';
import 'package:tmdb_prj/src/app/types/enums.dart';
import 'package:tmdb_prj/src/domain/entities/genre.dart';
import 'package:tmdb_prj/src/domain/entities/movie.dart';
import 'package:tmdb_prj/src/domain/entities/tvshow.dart';
import 'package:tmdb_prj/src/domain/usecases/genre/get_movie_genres.dart';
import 'package:tmdb_prj/src/domain/usecases/genre/get_tvshow_genres.dart';

part 'genre_event.dart';
part 'genre_state.dart';

class GenreBloc extends Bloc<GenreEvent, GenreState> {
  GenreParentItems currentGenreTopBarSelected = GenreParentItems.movie;

  Genre? selectedGenre;

  GetMovieGenres getMovieGenres;
  GetTvShowGenres getTvShowGenres;

  GenreBloc({
    required this.getMovieGenres,
    required this.getTvShowGenres,
  }) : super(GenreInitial()) {
    on<TopTabbarItemTappedEvent>((event, emit) async {
      /*
         
          todo: get list of top tabbar item AND first genre item related for body 
       */

      currentGenreTopBarSelected = event.genreParentItems;
      emit(const GenresListFetchLoadingState());

      Either<Failur, List<Genre>> result;
      if (event.genreParentItems == GenreParentItems.movie) {
        result = await getMovieGenres.call();
      } else {
        result = await getTvShowGenres.call();
      }

      result.fold(
          (left) => emit(GenresListFetchFailedState(message: (left as ServerFailuer).errorMessage)),
          (genres) {
        selectedGenre = genres.first;
        emit(GenresListFetchSuccessState(genres: genres));
      });
    });
  }
}
