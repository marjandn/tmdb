part of 'tvshow_list_bloc.dart';

abstract class TvshowListEvent extends Equatable {
  const TvshowListEvent();

  @override
  List<Object> get props => [];
}

class PopularTvshowFetchRequestEvent extends TvshowListEvent {
  final int page;
  const PopularTvshowFetchRequestEvent({required this.page});

  @override
  List<Object> get props => [page];
}

class FeaturedTvshowFetchRequestEvent extends TvshowListEvent {
  final int page;
  const FeaturedTvshowFetchRequestEvent({required this.page});

  @override
  List<Object> get props => [page];
}
