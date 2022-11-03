import 'package:flutter/material.dart';
import 'package:tmdb_prj/src/app/config/colors/colors.dart';
import 'package:tmdb_prj/src/app/constants/constants.dart';
import 'package:tmdb_prj/src/app/extensions/theme_extenesion.dart';
import 'package:tmdb_prj/src/domain/entities/movie.dart';

class MovieItemWidget extends StatelessWidget {
  final Movie movie;
  const MovieItemWidget({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                    image: NetworkImage("${Constants.imageBasePath}${movie.posterPath}"),
                    fit: BoxFit.cover)),
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
                    style:
                        context.appTheme.textTheme.bodyMedium!.copyWith(color: AppColors.grayColor),
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
                style: context.appTheme.textTheme.bodyMedium!.copyWith(color: AppColors.grayColor),
              )
            ],
          ))
        ],
      ),
    );
  }
}
