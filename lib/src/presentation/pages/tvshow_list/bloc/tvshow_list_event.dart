part of 'tvshow_list_bloc.dart';

abstract class TvshowListEvent extends Equatable {
  const TvshowListEvent();

  @override
  List<Object> get props => [];
}

class PageInitEvent extends TvshowListEvent {
  const PageInitEvent();
}

class PopularTvshowFetchRequestEvent extends TvshowListEvent {
  const PopularTvshowFetchRequestEvent();

  @override
  List<Object> get props => [];
}

class FeaturedTvshowFetchRequestEvent extends TvshowListEvent {
  const FeaturedTvshowFetchRequestEvent();

  @override
  List<Object> get props => [];
}
