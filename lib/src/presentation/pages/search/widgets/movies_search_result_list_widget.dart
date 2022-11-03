import 'package:flutter/cupertino.dart';
import 'package:tmdb_prj/src/domain/entities/movie.dart';
import 'package:tmdb_prj/src/presentation/pages/movies_list/widgets/movie_item_widget.dart';

class MoviesSearchResultListWidget extends StatelessWidget {
  const MoviesSearchResultListWidget({
    Key? key,
    required ScrollController scrollController,
    required this.showLazyLoading,
    required this.allMovies,
  })  : _scrollController = scrollController,
        super(key: key);

  final ScrollController _scrollController;
  final bool showLazyLoading;
  final List<Movie> allMovies;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      controller: _scrollController,
      itemCount: showLazyLoading ? allMovies.length + 1 : allMovies.length,
      itemBuilder: (context, index) => (index < allMovies.length)
          ? MovieItemWidget(
              movie: allMovies[index],
            )
          : showLazyLoading
              ? const CupertinoActivityIndicator()
              : const SizedBox(),
    );
  }
}
