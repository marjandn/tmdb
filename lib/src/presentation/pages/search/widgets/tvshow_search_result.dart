import 'package:flutter/cupertino.dart';
import 'package:tmdb_prj/src/domain/entities/tvshow.dart';
import 'package:tmdb_prj/src/presentation/pages/tvshow_list/widgets/tvshow_item_widget.dart';

class TvshowsSearchResultListWidget extends StatelessWidget {
  const TvshowsSearchResultListWidget({
    Key? key,
    required ScrollController scrollController,
    required this.showLazyLoading,
    required this.allTvShows,
  })  : _scrollController = scrollController,
        super(key: key);

  final ScrollController _scrollController;
  final bool showLazyLoading;
  final List<TvShow> allTvShows;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      controller: _scrollController,
      itemCount: showLazyLoading ? allTvShows.length + 1 : allTvShows.length,
      itemBuilder: (context, index) => (index < allTvShows.length)
          ? TvshowItemWidget(
              tvShow: allTvShows[index],
            )
          : showLazyLoading
              ? const CupertinoActivityIndicator()
              : const SizedBox(),
    );
  }
}
