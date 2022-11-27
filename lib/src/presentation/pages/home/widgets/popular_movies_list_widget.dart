import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_prj/src/app/config/colors/colors.dart';
import 'package:tmdb_prj/src/app/constants/constants.dart';
import 'package:tmdb_prj/src/app/extensions/theme_extenesion.dart';
import 'package:tmdb_prj/src/di/di.dart';
import 'package:tmdb_prj/src/domain/entities/movie.dart';
import 'package:tmdb_prj/src/domain/entities/movie_details.dart';
import 'package:tmdb_prj/src/presentation/pages/movie/bloc/movie_details_bloc.dart';
import 'package:tmdb_prj/src/presentation/pages/movie/movie_details_page.dart';

import '../bloc/home_bloc.dart';

class PopularMoviesListWidget extends StatelessWidget {
  const PopularMoviesListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) =>
          current is PopularMoviesFetchFailedState ||
          current is PopularMoviesFetchLoadingState ||
          current is PopularMoviesFetchSuccessState,
      builder: (context, state) {
        if (state is PopularMoviesFetchSuccessState) {
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            scrollDirection: Axis.horizontal,
            itemCount: state.movies.length,
            itemBuilder: (context, index) => SizedBox(
                width: 180, height: 300, child: MovieItemWidget(movie: state.movies[index])),
          );
        }

        return const CupertinoActivityIndicator();
      },
    );
  }
}

class MovieItemWidget extends StatelessWidget {
  final Movie movie;
  const MovieItemWidget({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      child: InkWell(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => injector<MovieDetailsBloc>(),
            child: MovieDetailsPage(movieId: movie.id),
          ),
        )),
        child: Column(
          children: [
            Expanded(
              flex: 9,
              child: Container(
                width: 170,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  boxShadow: [
                    BoxShadow(
                        color: context.appTheme.shadowColor,
                        blurRadius: 5,
                        offset: const Offset(0, 4)),
                    BoxShadow(
                        color: context.appTheme.shadowColor,
                        blurRadius: 5,
                        offset: const Offset(0, -1)),
                  ],
                  image: DecorationImage(
                      image: NetworkImage("${Constants.imageBasePath}${movie.posterPath}"),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: Text(
                movie.title ?? "",
                textAlign: TextAlign.center,
                style: context.appTheme.textTheme.subtitle1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.star_rounded,
                  color: AppColors.goldColor,
                  size: 18,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  movie.voteAverage.toString(),
                  style: context.appTheme.textTheme.labelMedium,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
