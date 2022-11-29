import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:tmdb_prj/src/app/errors/failure.dart';
import 'package:tmdb_prj/src/data/providers/remote/params/details_param.dart';
import 'package:tmdb_prj/src/domain/entities/credits.dart';
import 'package:tmdb_prj/src/domain/entities/tvshow_details.dart';
import 'package:tmdb_prj/src/domain/usecases/tvshow/get_tvshow_credits.dart';
import 'package:tmdb_prj/src/domain/usecases/tvshow/get_tvshow_details.dart';
import 'package:tmdb_prj/src/domain/usecases/tvshow/get_tvshow_pictures.dart';

part 'tvshow_details_event.dart';
part 'tvshow_details_state.dart';

class TvshowDetailsBloc extends Bloc<TvshowDetailsEvent, TvshowDetailsState> {
  final GetTvshowDetails getTvshowDetails;
  final GetTvshowPictures getTvshowPictures;
  final GetTvshowCredits getTvshowCredits;

  TvshowDetailsBloc(
      {required this.getTvshowCredits,
      required this.getTvshowDetails,
      required this.getTvshowPictures})
      : super(TvshowDetailsInitial()) {
    on<TvshowPrimaryDetailsRequestEvent>((event, emit) async {
      emit(const TvshowPrimaryDetailsLoadingState());

      Either<Failur, TvshowDetails> response =
          await getTvshowDetails.call(TvshowDetailsParam(tvshowId: event.tvshowId));

      response.fold((left) => emit(const TvshowPrimaryDetailsFailedState()),
          (right) => emit(TvshowPrimaryDetailsSuccessState(right)));
    });

    on<TvshowPicturesRequestEvent>(
      (event, emit) async {
        emit(const TvshowPicturesLoadingState());

        Either<Failur, List<String>> response =
            await getTvshowPictures.call(TvshowDetailsParam(tvshowId: event.tvshowId));

        response.fold((left) => emit(const TvshowPicturesFailedState()),
            (right) => emit(TvshowPicturesSuccessState(right)));
      },
    );

    on<TvshowCreditsRequestEvent>(
      (event, emit) async {
        emit(const TvshowCreditsLoadingState());

        Either<Failur, List<Credits>> response =
            await getTvshowCredits.call(TvshowDetailsParam(tvshowId: event.tvshowId));
        response.fold((left) => emit(const TvshowCreditsFailedState()),
            (right) => emit(TvshowCreditsSuccessState(right)));
      },
    );
  }
}
