import 'package:flutter/material.dart';
import 'package:tmdb_prj/src/app/extensions/theme_extenesion.dart';
import 'package:tmdb_prj/src/domain/entities/movie_details.dart';
import 'package:tmdb_prj/src/presentation/components/shared_components/tags_list_widget.dart';

class MoviePrimaryDetailsPartWidget extends StatelessWidget {
  final MovieDetails movieDetails;
  const MoviePrimaryDetailsPartWidget({Key? key, required this.movieDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          movieDetails.originalTitle,
          style: context.appTheme.textTheme.titleLarge,
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Text(
              movieDetails.releaseDate,
              style: context.appTheme.textTheme.labelMedium,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              movieDetails.productionCounties.first,
              style: context.appTheme.textTheme.labelMedium,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              movieDetails.runtime.toString(),
              style: context.appTheme.textTheme.labelMedium,
            ),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        TagsListWidget(
          tags: movieDetails.genres,
        ),
        const SizedBox(
          height: 32,
        ),
        Text(
          "Spoken Languages",
          style: context.appTheme.textTheme.titleMedium,
        ),
        const SizedBox(
          height: 12,
        ),
        TagsListWidget(
          tags: movieDetails.spokenLanguages,
        ),
        const SizedBox(
          height: 32,
        ),
        Text(
          "Plot Summary",
          style: context.appTheme.textTheme.titleMedium,
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          movieDetails.overview,
          style: context.appTheme.textTheme.bodyMedium,
        ),
        const SizedBox(
          height: 32,
        ),
      ],
    );
  }
}
