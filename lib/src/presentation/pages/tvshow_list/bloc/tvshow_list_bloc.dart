import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:tmdb_prj/src/app/errors/failure.dart';
import 'package:tmdb_prj/src/domain/entities/tvshow.dart';
import 'package:tmdb_prj/src/domain/usecases/movie/get_popular_movies.dart';
import 'package:tmdb_prj/src/domain/usecases/tvshow/get_featured_tvshows.dart';
import 'package:tmdb_prj/src/domain/usecases/tvshow/get_popular_tvshows.dart';

part 'tvshow_list_event.dart';
part 'tvshow_list_state.dart';

class TvshowListBloc extends Bloc<TvshowListEvent, TvshowListState> {
  final GetPopularTvShows getPopularTvShows;
  final GetFeaturedTvShows getFeaturedTvShows;

  int _totalPage = 1;
  int _currentPage = 0;

  dispose() {
    _totalPage = 1;
    _currentPage = 0;
  }

  TvshowListBloc({required this.getPopularTvShows, required this.getFeaturedTvShows})
      : super(TvshowListInitial()) {
    on<PageInitEvent>(
      (event, emit) {
        emit(TvshowListInitial());
      },
    );

    on<PopularTvshowFetchRequestEvent>((event, emit) async {
      if (!_showLazyLoading()) return;

      Either<Failur, List<TvShow>> tvshows =
          await getPopularTvShows.call(PagingParam(page: ++_currentPage));

      tvshows.fold((left) => emit(const TvshowFetchRequestFailedState()), (right) {
        _totalPage = right.first.totalPage ?? 1;

        emit(TvshowFetchRequestSuccessState(tvshows: right, isShowLoading: _showLazyLoading()));
      });
    });

    on<FeaturedTvshowFetchRequestEvent>((event, emit) async {
      if (!_showLazyLoading()) return;

      Either<Failur, List<TvShow>> tvshows =
          await getFeaturedTvShows.call(PagingParam(page: ++_currentPage));

      tvshows.fold((left) => emit(const TvshowFetchRequestFailedState()), (right) {
        _totalPage = right.first.totalPage ?? 1;

        emit(TvshowFetchRequestSuccessState(tvshows: right, isShowLoading: _showLazyLoading()));
      });
    });
  }

  bool _showLazyLoading() => _currentPage < _totalPage;
}
