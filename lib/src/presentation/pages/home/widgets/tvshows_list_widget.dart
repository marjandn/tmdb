import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_prj/src/app/config/colors/colors.dart';
import 'package:tmdb_prj/src/app/config/colors/styles.dart';
import 'package:tmdb_prj/src/app/constants/constants.dart';
import 'package:tmdb_prj/src/app/extensions/theme_extenesion.dart';
import 'package:tmdb_prj/src/di/di.dart';
import 'package:tmdb_prj/src/domain/entities/tvshow.dart';
import 'package:tmdb_prj/src/presentation/pages/tvshow/tvshow_details_page.dart';

import '../../tvshow/bloc/tvshow_details_bloc.dart';

class TvShowsListWidget extends StatelessWidget {
  final List<TvShow> tvShows;
  const TvShowsListWidget({Key? key, required this.tvShows}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        scrollDirection: Axis.horizontal,
        itemCount: tvShows.length,
        itemBuilder: (context, index) => TvshowItemWidget(
              tvshowDetails: tvShows[index],
            ));
  }
}

class TvshowItemWidget extends StatelessWidget {
  final TvShow tvshowDetails;
  const TvshowItemWidget({super.key, required this.tvshowDetails});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 300,
      child: InkWell(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => injector<TvshowDetailsBloc>(),
            child: TvshowDetailsPage(tvshowId: tvshowDetails.id),
          ),
        )),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          child: Column(
            children: [
              Expanded(
                flex: 9,
                child: Container(
                  width: 170,
                  decoration: AppStyles(context).imageContainerDecoration,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    child: CachedNetworkImage(
                      imageUrl: "${Constants.imageBasePath}${tvshowDetails.posterPath}",
                      placeholder: (context, url) =>
                          Image.asset("assets/images/film_placeholder.png", fit: BoxFit.cover),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: Text(
                  tvshowDetails.name ?? "",
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
                    tvshowDetails.voteAverage.toString(),
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
}
