import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_prj/src/app/constants/constants.dart';
import 'package:tmdb_prj/src/domain/entities/tvshow.dart';
import 'package:tmdb_prj/src/presentation/components/shared_widgets.dart';
import 'package:tmdb_prj/src/presentation/pages/tvshow_list/bloc/tvshow_list_bloc.dart';

import 'widgets/tvshow_item_widget.dart';

class TvShowListPage extends StatefulWidget {
  final String title;
  final TvshowTypes tvshowType;
  const TvShowListPage({super.key, required this.title, required this.tvshowType});

  @override
  State<TvShowListPage> createState() => _TvShowListPageState();
}

class _TvShowListPageState extends State<TvShowListPage> {
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = true;
  int _totalPage = 1;
  List<TvShow> allTvShows = [];
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _loadMore();

    _scrollController.addListener(() {
      if (_scrollController.offset >= _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange) {
        _loadMore();
      }
    });
  }

  _loadMore() {
    if (_currentPage < _totalPage) {
      _isLoading = true;
      switch (widget.tvshowType) {
        case TvshowTypes.popular:
          context.read<TvshowListBloc>().add(PopularTvshowFetchRequestEvent(page: ++_currentPage));
          break;
        default:
          context.read<TvshowListBloc>().add(FeaturedTvshowFetchRequestEvent(page: ++_currentPage));
          break;
      }
    } else {
      _isLoading = false;
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: baseAppBar(context: context, title: widget.title),
      body: Center(
        child: BlocBuilder<TvshowListBloc, TvshowListState>(
          buildWhen: (previous, current) =>
              current is TvshowFetchRequestFailedState || current is TvshowFetchRequestSuccessState,
          builder: (context, state) {
            if (state is TvshowFetchRequestSuccessState) {
              allTvShows.addAll(state.tvshows);
              _totalPage = state.tvshows.first.totalPage ?? 1;
              return ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.only(top: 32),
                itemCount: _isLoading ? allTvShows.length + 1 : allTvShows.length,
                itemBuilder: (context, index) => (index < allTvShows.length)
                    ? TvshowItemWidget(tvShow: allTvShows[index])
                    : (_isLoading)
                        ? const CupertinoActivityIndicator()
                        : const SizedBox(),
              );
            }
            return const CupertinoActivityIndicator();
          },
        ),
      ),
    );
  }
}
