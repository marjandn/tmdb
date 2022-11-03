part of 'tvshow_list_bloc.dart';

abstract class TvshowListState extends Equatable {
  const TvshowListState();

  @override
  List<Object?> get props => [];
}

class TvshowListInitial extends TvshowListState {}

class TvshowFetchRequestSuccessState extends TvshowListState {
  final List<TvShow> tvshows;
  final bool isShowLoading;
  const TvshowFetchRequestSuccessState({required this.tvshows, required this.isShowLoading});

  @override
  List<Object?> get props => [tvshows, isShowLoading];
}

class TvshowFetchRequestFailedState extends TvshowListState {
  const TvshowFetchRequestFailedState();
}
