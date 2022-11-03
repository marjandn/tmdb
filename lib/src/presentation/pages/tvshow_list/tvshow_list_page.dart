import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_prj/src/app/constants/constants.dart';
import 'package:tmdb_prj/src/domain/entities/tvshow.dart';
import 'package:tmdb_prj/src/presentation/components/shared_widgets.dart';
import 'package:tmdb_prj/src/presentation/pages/tvshow_list/bloc/tvshow_list_bloc.dart';

import 'widgets/tvshow_list_widget.dart';

class TvShowListPage extends StatefulWidget {
  final String title;
  final TvshowTypes tvshowType;
  const TvShowListPage({super.key, required this.title, required this.tvshowType});

  @override
  State<TvShowListPage> createState() => _TvShowListPageState();
}

class _TvShowListPageState extends State<TvShowListPage> {
  final ScrollController _scrollController = ScrollController();

  List<TvShow> allTvShows = [];

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
    switch (widget.tvshowType) {
      case TvshowTypes.popular:
        context.read<TvshowListBloc>().add(const PopularTvshowFetchRequestEvent());
        break;
      default:
        context.read<TvshowListBloc>().add(const FeaturedTvshowFetchRequestEvent());
        break;
    }
  }

  @override
  void didChangeDependencies() {
    // context.read<TvshowListBloc>().add(const PageInitEvent());
    context.read<TvshowListBloc>().dispose();

    super.didChangeDependencies();
  }

  late TvshowListBloc bloc;

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

              return TvshowListWidget(
                  scrollController: _scrollController,
                  isShowLazyLoading: state.isShowLoading,
                  allTvShows: allTvShows);
            }
            return const CupertinoActivityIndicator();
          },
        ),
      ),
    );
  }
}
