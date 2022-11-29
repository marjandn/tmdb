part of 'tvshow_details_bloc.dart';

abstract class TvshowDetailsEvent extends Equatable {
  const TvshowDetailsEvent();

  @override
  List<Object> get props => [];
}

class TvshowPrimaryDetailsRequestEvent extends TvshowDetailsEvent {
  final int tvshowId;
  const TvshowPrimaryDetailsRequestEvent(this.tvshowId);

  @override
  List<Object> get props => [tvshowId];
}

class TvshowPicturesRequestEvent extends TvshowDetailsEvent {
  final int tvshowId;
  const TvshowPicturesRequestEvent(this.tvshowId);

  @override
  List<Object> get props => [tvshowId];
}

class TvshowCreditsRequestEvent extends TvshowDetailsEvent {
  final int tvshowId;
  const TvshowCreditsRequestEvent(this.tvshowId);

  @override
  List<Object> get props => [tvshowId];
}
