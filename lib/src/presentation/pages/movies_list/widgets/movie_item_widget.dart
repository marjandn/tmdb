import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_prj/src/app/config/colors/colors.dart';
import 'package:tmdb_prj/src/app/config/colors/styles.dart';
import 'package:tmdb_prj/src/app/constants/constants.dart';
import 'package:tmdb_prj/src/app/extensions/theme_extenesion.dart';
import 'package:tmdb_prj/src/di/di.dart';
import 'package:tmdb_prj/src/domain/entities/movie.dart';
import 'package:tmdb_prj/src/presentation/pages/movie/bloc/movie_details_bloc.dart';
import 'package:tmdb_prj/src/presentation/pages/movie/movie_details_page.dart';

class MovieItemWidget extends StatelessWidget {
  final Movie movie;
  const MovieItemWidget({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => injector<MovieDetailsBloc>(),
              child: MovieDetailsPage(movieId: movie.id),
            ),
          ),
        ),
        child: Row(
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: AppStyles(context).imageContainerDecoration,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                child: CachedNetworkImage(
                  imageUrl: "${Constants.imageBasePath}${movie.posterPath}",
                  placeholder: (context, url) =>
                      Image.asset("assets/images/film_placeholder.png", fit: BoxFit.cover),
                  fit: BoxFit.cover,
                ),
              ),
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
                  movie.title ?? "",
                  style: context.appTheme.textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Text(
                      movie.releaseDate ?? "",
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
                        Text(movie.voteAverage.toString(),
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
                  movie.originalTitle.toString(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style:
                      context.appTheme.textTheme.bodyMedium!.copyWith(color: AppColors.grayColor),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
