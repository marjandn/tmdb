import 'package:flutter/material.dart';
import 'package:tmdb_prj/src/app/extensions/theme_extenesion.dart';
import 'package:tmdb_prj/src/domain/entities/tvshow_details.dart';
import 'package:tmdb_prj/src/presentation/components/shared_components/tags_list_widget.dart';

class TvshowPrimaryDetailsPartWidget extends StatelessWidget {
  final TvshowDetails tvshowDetails;
  const TvshowPrimaryDetailsPartWidget({Key? key, required this.tvshowDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          tvshowDetails.originalTitle,
          style: context.appTheme.textTheme.titleLarge,
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Text(
              tvshowDetails.releaseDate,
              style: context.appTheme.textTheme.labelMedium,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              tvshowDetails.productionCounties.first,
              style: context.appTheme.textTheme.labelMedium,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              tvshowDetails.runtime.toString(),
              style: context.appTheme.textTheme.labelMedium,
            ),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        TagsListWidget(
          tags: tvshowDetails.genres,
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
          tags: tvshowDetails.spokenLanguages,
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
          tvshowDetails.overview,
          style: context.appTheme.textTheme.bodyMedium,
        ),
        const SizedBox(
          height: 32,
        ),
      ],
    );
  }
}
