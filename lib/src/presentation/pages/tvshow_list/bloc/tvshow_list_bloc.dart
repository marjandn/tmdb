import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:tmdb_prj/src/app/errors/failure.dart';
import 'package:tmdb_prj/src/domain/entities/tvshow.dart';
import 'package:tmdb_prj/src/domain/usercases/movie/get_popular_movies.dart';
import 'package:tmdb_prj/src/domain/usercases/tvshow/get_featured_tvshows.dart';
import 'package:tmdb_prj/src/domain/usercases/tvshow/get_popular_tvshows.dart';

part 'tvshow_list_event.dart';
part 'tvshow_list_state.dart';

class TvshowListBloc extends Bloc<TvshowListEvent, TvshowListState> {
  final GetPopularTvShows getPopularTvShows;
  final GetFeaturedTvShows getFeaturedTvShows;
  TvshowListBloc({required this.getPopularTvShows, required this.getFeaturedTvShows})
      : super(TvshowListInitial()) {
    on<PopularTvshowFetchRequestEvent>((event, emit) async {
      Either<Failur, List<TvShow>> tvshows =
          await getPopularTvShows.call(PagingParam(page: event.page));

      tvshows.fold((left) => emit(const TvshowFetchRequestFailedState()),
          (right) => emit(TvshowFetchRequestSuccessState(tvshows: right)));
    });
    on<FeaturedTvshowFetchRequestEvent>((event, emit) async {
      Either<Failur, List<TvShow>> tvshows =
          await getFeaturedTvShows.call(PagingParam(page: event.page));

      tvshows.fold((left) => emit(const TvshowFetchRequestFailedState()),
          (right) => emit(TvshowFetchRequestSuccessState(tvshows: right)));
    });
  }
}
