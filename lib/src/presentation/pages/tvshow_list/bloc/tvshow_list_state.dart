part of 'tvshow_list_bloc.dart';

abstract class TvshowListState extends Equatable {
  const TvshowListState();

  @override
  List<Object> get props => [];
}

class TvshowListInitial extends TvshowListState {}

class TvshowFetchRequestSuccessState extends TvshowListState {
  final List<TvShow> tvshows;
  const TvshowFetchRequestSuccessState({required this.tvshows});

  @override
  List<Object> get props => [tvshows];
}

class TvshowFetchRequestFailedState extends TvshowListState {
  const TvshowFetchRequestFailedState();
}
