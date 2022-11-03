import 'package:flutter/cupertino.dart';
import 'package:tmdb_prj/src/domain/entities/movie.dart';

import 'movie_item_widget.dart';

class MoviesListWidget extends StatelessWidget {
  const MoviesListWidget({
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
      controller: _scrollController,
      padding: const EdgeInsets.only(top: 32),
      itemCount: showLazyLoading ? allMovies.length + 1 : allMovies.length,
      itemBuilder: (context, index) => (index < allMovies.length)
          ? MovieItemWidget(movie: allMovies[index])
          : (showLazyLoading)
              ? const CupertinoActivityIndicator()
              : const SizedBox(),
    );
  }
}
