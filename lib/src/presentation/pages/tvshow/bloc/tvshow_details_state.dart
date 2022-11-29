part of 'tvshow_details_bloc.dart';

abstract class TvshowDetailsState extends Equatable {
  const TvshowDetailsState();

  @override
  List<Object> get props => [];
}

class TvshowDetailsInitial extends TvshowDetailsState {}

class TvshowPrimaryDetailsLoadingState extends TvshowDetailsState {
  const TvshowPrimaryDetailsLoadingState();
}

class TvshowPrimaryDetailsFailedState extends TvshowDetailsState {
  const TvshowPrimaryDetailsFailedState();
}

class TvshowPrimaryDetailsSuccessState extends TvshowDetailsState {
  final TvshowDetails tvShow;
  const TvshowPrimaryDetailsSuccessState(this.tvShow);
  @override
  List<Object> get props => [tvShow];
}

// * Tv show Credits

class TvshowCreditsLoadingState extends TvshowDetailsState {
  const TvshowCreditsLoadingState();
}

class TvshowCreditsFailedState extends TvshowDetailsState {
  const TvshowCreditsFailedState();
}

class TvshowCreditsSuccessState extends TvshowDetailsState {
  final List<Credits> credits;
  const TvshowCreditsSuccessState(this.credits);
  @override
  List<Object> get props => [credits];
}

// * Tv show Pictures

class TvshowPicturesLoadingState extends TvshowDetailsState {
  const TvshowPicturesLoadingState();
}

class TvshowPicturesFailedState extends TvshowDetailsState {
  const TvshowPicturesFailedState();
}

class TvshowPicturesSuccessState extends TvshowDetailsState {
  final List<String> pictures;
  const TvshowPicturesSuccessState(this.pictures);
  @override
  List<Object> get props => [pictures];
}
