import 'package:flutter/cupertino.dart';
import 'package:tmdb_prj/src/domain/entities/tvshow.dart';

import 'tvshow_item_widget.dart';

class TvshowListWidget extends StatelessWidget {
  const TvshowListWidget({
    Key? key,
    required ScrollController scrollController,
    required this.isShowLazyLoading,
    required this.allTvShows,
  })  : _scrollController = scrollController,
        super(key: key);

  final ScrollController _scrollController;
  final bool isShowLazyLoading;
  final List<TvShow> allTvShows;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.only(top: 32),
      itemCount: isShowLazyLoading ? allTvShows.length + 1 : allTvShows.length,
      itemBuilder: (context, index) => (index < allTvShows.length)
          ? TvshowItemWidget(tvShow: allTvShows[index])
          : (isShowLazyLoading)
              ? const CupertinoActivityIndicator()
              : const SizedBox(),
    );
  }
}
