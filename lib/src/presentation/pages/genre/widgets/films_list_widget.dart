import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_prj/src/app/config/colors/colors.dart';
import 'package:tmdb_prj/src/app/extensions/theme_extenesion.dart';
import 'package:tmdb_prj/src/presentation/pages/genre/bloc/genre_bloc.dart';

class FilmsListWidget extends StatelessWidget {
  const FilmsListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenreBloc, GenreState>(
      buildWhen: (previous, current) {
        return current is BodyListFetchLoading ||
            current is MoviesListFetchSuccessState ||
            current is TvShowsListFetchSuccessState ||
            current is BodyListFatchFaildState;
      },
      builder: (context, state) {
        print("FilmsList builder: $state");
        return ListView.builder(
          padding: const EdgeInsets.only(top: 32),
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
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
                          image: AssetImage("assets/images/film_cover.jpg"), fit: BoxFit.cover)),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Brakin bad",
                      style: context.appTheme.textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Text(
                          "2012-02-11",
                          style: context.appTheme.textTheme.bodyMedium!
                              .copyWith(color: AppColors.grayColor),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Wrap(
                          children: [
                            const Icon(
                              Icons.star_rounded,
                              color: AppColors.goldColor,
                              size: 13,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text("3.4",
                                style: context.appTheme.textTheme.bodySmall!.copyWith(
                                  color: AppColors.goldColor,
                                ))
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Some line text about film, Some line text about film, Some line text about film, Some line text about film",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: context.appTheme.textTheme.bodyMedium!
                          .copyWith(color: AppColors.grayColor),
                    )
                  ],
                ))
              ],
            ),
          ),
        );
      },
    );
  }
}
