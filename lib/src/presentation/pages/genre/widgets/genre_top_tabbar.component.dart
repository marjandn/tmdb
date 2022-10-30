import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_prj/src/app/extensions/context_extension.dart';
import 'package:tmdb_prj/src/app/extensions/theme_extenesion.dart';
import 'package:tmdb_prj/src/app/types/enums.dart';
import 'package:tmdb_prj/src/presentation/pages/genre/bloc/genre_bloc.dart';

class TopTabbarWidget extends StatelessWidget {
  const TopTabbarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("TopTabbarWidget build again !");
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  context.read<GenreBloc>().add(
                      const TopTabbarItemTappedEvent(genreParentItems: GenreParentItems.movie));
                  // context.read<GenreFilmsBloc>().add(const GenreMoviesRequest());
                },
                child: Text(
                  "Movie",
                  textAlign: TextAlign.center,
                  style: context.appTheme.textTheme.titleLarge,
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  context.read<GenreBloc>().add(
                      const TopTabbarItemTappedEvent(genreParentItems: GenreParentItems.tvshow));
                  // context.read<GenreFilmsBloc>().add(const GenreTvShowRequest());
                },
                child: Text(
                  "Tv Show",
                  textAlign: TextAlign.center,
                  style: context.appTheme.textTheme.titleLarge,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30,
          child: Stack(children: [
            AnimatedPositioned(
              curve: Curves.easeInOutBack,
              top: 10,
              left: context.select<GenreBloc, GenreParentItems>(
                          (GenreBloc bloc) => bloc.currentGenreTopBarSelected) ==
                      GenreParentItems.movie
                  ? context.halfSecondWidthSize
                  : context.halfSecondWidthSize * 3,
              duration: const Duration(seconds: 1),
              child: const Icon(
                Icons.circle,
                color: Colors.red,
                size: 10,
              ),
            ),
          ]),
        ),
      ],
    );
  }
}
