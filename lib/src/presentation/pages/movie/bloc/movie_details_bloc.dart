import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:tmdb_prj/src/data/providers/remote/params/details_param.dart';
import 'package:tmdb_prj/src/domain/entities/credits.dart';
import 'package:tmdb_prj/src/domain/entities/movie_details.dart';
import 'package:tmdb_prj/src/domain/usecases/movie/get_movie_credits.dart';
import 'package:tmdb_prj/src/domain/usecases/movie/get_movie_details.dart';
import 'package:tmdb_prj/src/domain/usecases/movie/get_movie_pictures.dart';

import '../../../../app/errors/failure.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetails getMovieDetails;
  final GetMoviePictures getMoviePictures;
  final GetMovieCredits getMovieCredits;

  MovieDetailsBloc(
      {required this.getMovieDetails,
      required this.getMoviePictures,
      required this.getMovieCredits})
      : super(MovieDetailsInitial()) {
    on<MoviePrimaryDetailsRequestEvent>((event, emit) async {
      emit(const MoviePrimaryDetailsLoadingState());

      Either<Failur, MovieDetails> response =
          await getMovieDetails.call(MovieDetailsParam(movieId: event.movieId));

      response.fold((left) => emit(const MoviePrimaryDetailsFailedState()),
          (right) => emit(MoviePrimaryDetailsSuccessState(movieDetails: right)));
    });

    on<MoviePicturesRequestEvent>(
      (event, emit) async {
        emit(const MoviePicturesLoadingState());

        Either<Failur, List<String>> response =
            await getMoviePictures.call(MovieDetailsParam(movieId: event.movieId));

        response.fold((left) => emit(const MoviePicturesFailedState()),
            (right) => emit(MoviePicturesSuccessState(right)));
      },
    );

    on<MovieCreditsRequestEvent>(
      (event, emit) async {
        emit(const MovieCreditsLoadingState());

        Either<Failur, List<Credits>> response =
            await getMovieCredits.call(MovieDetailsParam(movieId: event.movieId));
        response.fold((left) => emit(const MovieCreditsFailedState()),
            (right) => emit(MovieCreditsSuccessState(right)));
      },
    );
  }
}
