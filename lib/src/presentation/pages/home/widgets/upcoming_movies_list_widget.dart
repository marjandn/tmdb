import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_prj/src/app/config/colors/colors.dart';
import 'package:tmdb_prj/src/app/constants/constants.dart';
import 'package:tmdb_prj/src/app/extensions/theme_extenesion.dart';

import '../bloc/home_bloc.dart';

class UpcomingMoviesListWidget extends StatelessWidget {
  const UpcomingMoviesListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) =>
          current is UpcomingMoviesFetchFailedState ||
          current is UpcomingMoviesFetchLoadingState ||
          current is UpcomingMoviesFetchSuccessState,
      builder: (context, state) {
        if (state is UpcomingMoviesFetchSuccessState) {
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            scrollDirection: Axis.horizontal,
            itemCount: state.movies.length,
            itemBuilder: (context, index) => SizedBox(
              width: 180,
              height: 300,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
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
                              image: NetworkImage(
                                  "${Constants.imageBasePath}${state.movies[index].posterPath}"),
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
                        state.movies[index].title ?? "",
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
                          state.movies[index].voteAverage.toString(),
                          style: context.appTheme.textTheme.labelMedium,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        }

        return const CupertinoActivityIndicator();
      },
    );
  }
}
